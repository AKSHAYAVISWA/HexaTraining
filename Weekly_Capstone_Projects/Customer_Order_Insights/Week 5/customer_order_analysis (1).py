import os
import numpy as np
import pandas as pd
import requests

API_URL = "https://api.sampledata.com/orders"
LOCAL_CSV_PATH = os.path.join(os.path.dirname(__file__), "orders.csv")

try:
    response = requests.get(API_URL, timeout=3)
    response.raise_for_status()
    print(f"Fetched data from API: {API_URL}")
    df = pd.DataFrame(response.json())
except requests.RequestException as e:
    print(f"API unavailable ({e}). Falling back to local CSV.")
    df = pd.read_csv(LOCAL_CSV_PATH)

# Clean data
df = df.dropna(subset=["customer_id", "delivery_date"]).copy()
df["issue_type"] = df["issue_type"].fillna("No Issue Reported")

# Convert dates
df["order_date"] = pd.to_datetime(df["order_date"])
df["delivery_date"] = pd.to_datetime(df["delivery_date"])

# Calculate delay
df["delay_days"] = (pd.Timestamp.today() - df["delivery_date"]).dt.days
df["delayed"] = np.where(df["delay_days"] > 0, 1, 0)

print("\nCleaned Data:")
print(df)

# Top delayed customers
top_delayed_customers = (
    df.groupby("customer_id")["delayed"]
      .sum()
      .sort_values(ascending=False)
)

print("\nTop Delayed Customers")
print(top_delayed_customers)

# Delivery issues
issue_counts = df["issue_type"].value_counts()

print("\nMost Common Delivery Issues")
print(issue_counts)

# Save cleaned data
df.to_csv("cleaned_orders.csv", index=False)

# Create log file
log_file = "delay_summary.log"

with open(log_file, "w") as f:
    f.write("Customer Order Insights Summary\n")
    f.write("=" * 40 + "\n\n")

    f.write("Top Delayed Customers\n")
    f.write(top_delayed_customers.to_string())

    f.write("\n\nMost Common Delivery Issues\n")
    f.write(issue_counts.to_string())

print("Delay summary generated.")
print("Pipeline executed successfully.")