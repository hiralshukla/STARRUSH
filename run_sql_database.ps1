# run_sql_database.ps1

Set-Location "$PSScriptRoot\sql-database\"

cmd /c "sql -thin starrush/starrush123@localhost:1521/XEPDB1 @06_run_all_scripts.sql"

Set-Location $PSScriptRoot