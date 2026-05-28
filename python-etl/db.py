import os
import oracledb
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    user = os.getenv("ORACLE_USER")
    password = os.getenv("ORACLE_PASSWORD")
    dsn = os.getenv("ORACLE_DSN")

    if not user or not password or not dsn:
        raise ValueError("Missing Oracle database environment variables.")

    return oracledb.connect(
        user=user,
        password=password,
        dsn=dsn
    )