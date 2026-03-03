-- Lab 17: Data Import/Export and Backup
-- Example COPY export (CSV file)
COPY employees TO '/tmp/employees.csv' WITH CSV HEADER;

-- Example COPY import (CSV file)
COPY employees FROM '/tmp/employees.csv' WITH CSV HEADER;

-- Export results of a query
COPY (
    SELECT * FROM employees WHERE department = 'Engineering'
) TO '/tmp/engineering_employees.csv' WITH CSV HEADER;

-- Create a restore point
SELECT pg_create_restore_point('before_backup');

-- Force a WAL switch (used for archiving and PITR)
SELECT pg_switch_wal();
