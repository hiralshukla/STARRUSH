import pandas as pd

def clean_text(value):
    if pd.isna(value):
        return None

    value = str(value)

    # Normalize weird spacing
    value = value.strip()

    # Optional: replace curly/smart characters if they ever appear
    replacements = {
        "’": "'",
        "‘": "'",
        "“": '"',
        "”": '"',
        "—": "-",
        "–": "-",
        "→": "-"
    }

    for old, new in replacements.items():
        value = value.replace(old, new)

    return value

def transform_creators(df):
    print("Transforming creators data...")

    text_columns = [
        "FirstName",
        "LastName",
        "Email",
        "HeadShotImage",
        "ProfileImage",
        "AboutMe",
        "WorkExperience",
        "CreatorRole"
    ]

    for column in text_columns:
        if column in df.columns:
            df[column] = df[column].apply(clean_text)

    return df