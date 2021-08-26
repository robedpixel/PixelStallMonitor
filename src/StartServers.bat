start "database" "docker/postgres/PostgreSQLPortable.exe" && ^
timeout /t 3 && ^
cd %~dp0 && ^
cd server
start "pythonserver" "runserver.bat"