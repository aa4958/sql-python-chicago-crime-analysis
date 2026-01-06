"""Builds a SQLite database from the CSVs in /data.

Creates: outputs/Final.db
Tables:
- CENSUS
- CRIME
- SCHOOLS

Usage:
  python scripts/build_sqlite_db.py
"""

from __future__ import annotations
import sqlite3
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
DATA_DIR = ROOT / "data"
OUT_DIR = ROOT / "outputs"
DB_PATH = OUT_DIR / "Final.db"

def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    census = pd.read_csv(DATA_DIR / "ChicagoCensusData.csv")
    crime = pd.read_csv(DATA_DIR / "ChicagoCrimeData.csv")
    schools = pd.read_csv(DATA_DIR / "ChicagoPublicSchools.csv")
    with sqlite3.connect(DB_PATH) as con:
        census.to_sql("CENSUS", con, if_exists="replace", index=False, method="multi", chunksize=200)
        crime.to_sql("CRIME", con, if_exists="replace", index=False, method="multi", chunksize=200)
        schools.to_sql("SCHOOLS", con, if_exists="replace", index=False, method="multi", chunksize=200)
        # Row count sanity checks
        for table in ("CENSUS", "CRIME", "SCHOOLS"):
            row_count = pd.read_sql(f"SELECT COUNT(*) AS rows FROM {table};", con).iloc[0]["rows"]
            print(f"{table}: {row_count} rows")
        print(f"Database created: {DB_PATH}")

if __name__ == "__main__":
    main()
