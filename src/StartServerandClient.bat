start "database" "docker/postgres/PostgreSQLPortable.exe" && ^
timeout /t 3 && ^
cd %~dp0 && ^
cd server
start "pythonserver" "runserver.bat"
timeout /t 5 && ^
%UserProfile%\Miniconda3\Scripts\activate.bat && ^
conda activate pixelenv && ^
cd %~dp0 && ^
cd client && ^
python FS2_Goh_Nurawan_Ge.py