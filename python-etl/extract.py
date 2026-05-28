import pandas as pd

def extract_creators(csv_path):
    print(f"Extracting data from {csv_path}...")
    return pd.read_csv(csv_path)