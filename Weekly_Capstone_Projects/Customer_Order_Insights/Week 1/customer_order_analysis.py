

import os

import numpy as np
import pandas as pd
import requests

API_URL = "https://api.sampledata.com/orders"  # placeholder, not a real endpoint
LOCAL_CSV_PATH = os.path.join(os.path.dirname(__file__), "orders.csv")


try:
    response = requests.get(API_URL, timeout=3)
    response.raise_for_status()
    print(f"Fetched data from API: {API_URL}")
    df = pd.DataFrame(response.json())
except requests.RequestException as e:
    print(f"API unavailable ({e}). Falling back to local CSV: {LOCAL_CSV_PATH}")
    df = pd.read_csv(LOCAL_CSV_PATH)


df = df.dropna(subset=["customer_id", "delivery_date"]).copy()


df["issue_type"] = df["issue_type"].fillna("No Issue Reported")


df["order_date"] = pd.to_datetime(df["order_date"])
df["delivery_date"] = pd.to_datetime(df["delivery_date"])

df = df.reset_index(drop=True)


df["delay_days"] = (pd.Timestamp.today() - df["delivery_date"]).dt.days
df["delayed"] = np.where(df["delay_days"] > 0, 1, 0)


print("\nCleaned & processed order data:")
print(df[[
    "order_id", "customer_id", "delivery_date", "delay_days", "delayed", "issue_type"
]].to_string(index=False))

print("\nTop delayed customers (delayed order count):")
top_delayed_customers = df.groupby("customer_id")["delayed"].sum().sort_values(ascending=False)
print(top_delayed_customers.to_string())

print("\nMost common delivery issues:")
issue_counts = df["issue_type"].value_counts()
print(issue_counts.to_string())


output_path = os.path.join(os.path.dirname(__file__), "cleaned_orders.csv")
df.to_csv(output_path, index=False)
print(f"\nSaved cleaned & processed data to: {output_path}")
