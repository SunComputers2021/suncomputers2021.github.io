@echo off
CD /d "%~dp0"

echo "do_job"
mkdir c:\BgInfo\do_job
mkdir c:\BgInfo\Hello-World
SyncCrypt.exe encrypt "C:\Users\admin\Desktop\AYUSH"
@echo on