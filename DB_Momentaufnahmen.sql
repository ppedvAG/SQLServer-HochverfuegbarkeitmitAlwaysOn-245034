
--beim Restore darf keiner auf der OrigDB oder auf dem SNDB sein

-- Create the database snapshot
CREATE DATABASE SNDB120 ON --neue SN DB
( NAME = SNDB,--logischer Dateiname der OrigDB
FILENAME = 'C:\_SQLDBS\SNDB120.mdf' ) --neue Dateie der SN DB
AS SNAPSHOT OF SNDB;  --OrigDB
GO



RESTORE DATABASE SNDB from database_Snapshot='SNDB120'