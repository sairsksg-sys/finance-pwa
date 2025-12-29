import sqlite3
db = sqlite3.connect("finance.db")
c = db.cursor()

# Users
c.execute("""
CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY,
email TEXT UNIQUE,
password TEXT
)
""")

# Expenses
c.execute("""
CREATE TABLE IF NOT EXISTS expenses (
id INTEGER PRIMARY KEY,
title TEXT,
description TEXT,
date TEXT,
country TEXT,
currency TEXT,
mode TEXT,
mode_other TEXT,
amount REAL
)
""")

# Investments
c.execute("""
CREATE TABLE IF NOT EXISTS investments (
id INTEGER PRIMARY KEY,
instrument TEXT,
instrument_other TEXT,
title TEXT,
description TEXT,
country TEXT,
currency TEXT,
invest_date TEXT,
maturity_date TEXT,
principal REAL,
interest REAL,
maturity_value REAL
)
""")

# Payments
c.execute("""
CREATE TABLE IF NOT EXISTS payments (
id INTEGER PRIMARY KEY,
title TEXT,
description TEXT,
country TEXT,
currency TEXT,
interval TEXT,
due_date TEXT,
mode TEXT,
mode_other TEXT,
reminder_value INTEGER,
reminder_unit TEXT,
email TEXT
)
""")

db.commit()
db.close()
print("Database initialized successfully")
