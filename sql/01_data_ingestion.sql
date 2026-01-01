-- Raw table creation
DROP TABLE IF EXISTS sales_raw;

CREATE TABLE sales_raw (
    retailer TEXT,
    retailer_id TEXT,
    invoice_date TEXT,
    region TEXT,
    state TEXT,
    city TEXT,
    product TEXT,
    price_per_unit TEXT,
    units_sold TEXT,
    total_sales TEXT,
    operating_profit TEXT,
    operating_margin TEXT,
    sales_method TEXT
);

-- Clean table creation
DROP TABLE IF EXISTS sales_clean;

CREATE TABLE sales_clean (
    retailer TEXT,
    retailer_id INTEGER,
    invoice_date DATE,
    region TEXT,
    state TEXT,
    city TEXT,
    product TEXT,
    price_per_unit NUMERIC(10,2),
    units_sold INTEGER,
    total_sales NUMERIC(12,2),
    operating_profit NUMERIC(12,2),
    operating_margin NUMERIC(5,2),
    sales_method TEXT
);

-- Raw → Clean transformation
INSERT INTO sales_clean
SELECT
    retailer,
    retailer_id::INTEGER,
    TO_DATE(invoice_date, 'MM/DD/YYYY'),
    region,
    state,
    city,
    product,
    REPLACE(price_per_unit, '$', '')::NUMERIC,
    REPLACE(units_sold, ',', '')::INTEGER,
    REPLACE(REPLACE(total_sales, '$', ''), ',', '')::NUMERIC,
    REPLACE(REPLACE(operating_profit, '$', ''), ',', '')::NUMERIC,
    REPLACE(operating_margin, '%', '')::NUMERIC,
    sales_method
FROM sales_raw;
