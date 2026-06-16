import json
import os

import numpy as np
import pandas as pd
import requests

API_URL = "https://api.sampledata.com/orders"  # placeholder, not a real endpoint
LOCAL_DATA_PATH = os.path.join(os.path.dirname(__file__), "orders_data.json")

try:
    response = requests.get(API_URL, timeout=3)
    response.raise_for_status()
    print(f"Fetched data from API: {API_URL}")
    raw_data = response.json()
except requests.RequestException as e:
    print(f"API unavailable ({e}). Falling back to local data: {LOCAL_DATA_PATH}")
    with open(LOCAL_DATA_PATH, "r") as f:
        raw_data = json.load(f)

df = pd.DataFrame(raw_data)


df = df.dropna(subset=["delivery_date", "quantity", "stock_level"]).copy()

df["order_date"] = pd.to_datetime(df["order_date"])
df["delivery_date"] = pd.to_datetime(df["delivery_date"])

df["quantity"] = df["quantity"].astype(int)
df["stock_level"] = df["stock_level"].astype(int)
df["reorder_threshold"] = df["reorder_threshold"].astype(int)

df = df.reset_index(drop=True)


df["delay_days"] = (df["delivery_date"] - df["order_date"]).dt.days
df["is_delayed"] = np.where(df["delay_days"] > 7, 1, 0)
df["needs_reorder"] = np.where(df["stock_level"] < df["reorder_threshold"], 1, 0)
df["order_value"] = (df["quantity"] * df["unit_price"]).round(2)

print("\nCleaned & processed data:")
print(df[[
    "order_id", "supplier_id", "delay_days", "is_delayed",
    "stock_level", "needs_reorder", "order_value"
]].to_string(index=False))

print("\nSummary stats:")
print(f"  Average delivery delay: {np.mean(df['delay_days']):.1f} days")
print(f"  Delayed orders: {int(df['is_delayed'].sum())} of {len(df)}")
print(f"  Orders needing reorder: {int(df['needs_reorder'].sum())} of {len(df)}")
print(f"  Total order value: ${np.sum(df['order_value']):.2f}")

output_path = os.path.join(os.path.dirname(__file__), "orders_data.csv")
df.to_csv(output_path, index=False)
print(f"\nSaved cleaned & processed data to: {output_path}")