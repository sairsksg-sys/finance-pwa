-- Payments
CREATE TABLE payments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  description TEXT,
  country TEXT,
  currency TEXT,
  interval TEXT,
  due_date DATE,
  mode TEXT,
  mode_other TEXT,
  reminder_value INTEGER,
  reminder_unit TEXT,
  email TEXT,
  status TEXT
);

-- Expenses

CREATE TABLE IF NOT EXISTS expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    title TEXT NOT NULL,
    description TEXT,

    date TEXT NOT NULL,               -- YYYY-MM-DD
    country TEXT NOT NULL,            -- SG / IND
    currency TEXT NOT NULL,           -- SGD / INR

    mode TEXT NOT NULL,               -- Cash, Card, GPay, Paynow, Others
    mode_other TEXT,                  -- if mode = Others

    amount REAL NOT NULL,

    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);


-- Investments

CREATE TABLE IF NOT EXISTS investments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    instrument TEXT NOT NULL,          -- Bonds, Equities, FD, etc.
    instrument_other TEXT,

    title TEXT NOT NULL,
    description TEXT,

    country TEXT NOT NULL,             -- SG / IND
    currency TEXT NOT NULL,            -- SGD / INR

    invest_date TEXT NOT NULL,         -- YYYY-MM-DD
    maturity_date TEXT,                -- optional

    principal REAL NOT NULL,
    interest REAL,                     -- %
    maturity_value REAL,               -- auto calculated

    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Indexes

CREATE INDEX IF NOT EXISTS idx_expenses_date
ON expenses(date);

CREATE INDEX IF NOT EXISTS idx_expenses_country
ON expenses(country);

CREATE INDEX IF NOT EXISTS idx_investments_date
ON investments(invest_date);

CREATE INDEX IF NOT EXISTS idx_investments_country
ON investments(country);

