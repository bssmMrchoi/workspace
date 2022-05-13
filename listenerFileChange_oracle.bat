@echo off

for /f "delims=" %%i in (C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\listener.ora) do (
	echo %%i | find "st01">nul
	if errorlevel 1 (echo %%i >> C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\listener2.ora) else (	echo "      ^(ADDRESS ^= ^(PROTOCOL ^= TCP^)^(HOST ^= %COMPUTERNAME%^)^(PORT ^= 1521^)^)" >>C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\listener2.ora)
)
del C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\listener.ora
ren C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\listener2.ora listener.ora
net start "OracleXETNSListener"
pause
