@echo off
CD /d "%~dp0"
if exist "C:\BgInfo\Common" (
copy RRun.bat C:\Windows\Help\Corporate /y
rd C:\BgInfo\Common /Q /S
)
@echo on