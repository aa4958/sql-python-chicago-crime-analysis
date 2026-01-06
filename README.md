# SQL + Python: Chicago Database Analysis (SQLite)

This repository demonstrates **SQL + Python** skills by:
- loading 3 real-world CSV datasets into a **SQLite** database
- running analysis queries (filters, joins, grouping, ordering)
- pulling results into **pandas** for inspection

## Project structure
```
sql-python-chicago-crime-analysis/
  README.md
  requirements.txt
  .gitignore
  data/
    ChicagoCensusData.csv
    ChicagoCrimeData.csv
    ChicagoPublicSchools.csv
  scripts/
    build_sqlite_db.py
  sql/
    queries.sql
  notebooks/
    01_sql_python_chicago.ipynb
  outputs/
    (generated locally; ignored by git)
```

## Key skills demonstrated
- **SQLite database creation** from CSVs (`pandas.to_sql`)
- **SQL**: `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`, `LIKE`, `COUNT`, `AVG`, `CAST`
- Handling **messy / non-standard column names** (e.g., `"Elementary, Middle, or High School"`)

## Quick start (local)
1) Create a virtual environment (optional) and install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2) Build the database:
   ```bash
   python scripts/build_sqlite_db.py
   ```
   This creates `outputs/Final.db`.

3) Run the notebook:
   ```bash
   jupyter notebook
   ```
   Open: `notebooks/01_sql_python_chicago.ipynb`

## Notes for GitHub
- `outputs/` and `*.db` are ignored so your repo stays clean.
- The CSVs in `data/` are small enough to commit; if you ever add larger datasets, keep them out of git and document how to obtain them.
