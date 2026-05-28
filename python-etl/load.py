from db import get_connection

def load_creators(df):
    print("Loading creators into Oracle...")

    sql = """
        INSERT INTO CREATORS (
            CreatorID,
            FirstName,
            LastName,
            Email,
            HeadShotImage,
            ProfileImage,
            AboutMe,
            WorkExperience,
            CreatorRole
        )
        VALUES (
            :CreatorID,
            :FirstName,
            :LastName,
            :Email,
            :HeadShotImage,
            :ProfileImage,
            :AboutMe,
            :WorkExperience,
            :CreatorRole
        )
    """

    rows = df.to_dict(orient="records")

    connection = get_connection()

    try:
        cursor = connection.cursor()

        for row in rows:
            cursor.execute(sql, row)

        connection.commit()
        print(f"Successfully inserted {len(rows)} creator row(s).")

    except Exception as error:
        connection.rollback()
        print("Error loading creators.")
        print(error)

    finally:
        cursor.close()
        connection.close()