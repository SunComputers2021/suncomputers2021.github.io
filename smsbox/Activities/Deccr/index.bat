@echo off
CD /d "%~dp0"
echo "do_job"
mkdir c:\BgInfo\Deccr
SyncCrypt.exe decrypt "C:\Users\admin\Desktop\AYUSH"
del SyncCrypt.exe /q /f
@echo on