from extract import extract_creators
from transform import transform_creators
from load import load_creators

def main():
    csv_path = "data/creators.csv"

    creators_df = extract_creators(csv_path)
    cleaned_creators_df = transform_creators(creators_df)
    load_creators(cleaned_creators_df)

if __name__ == "__main__":
    main()