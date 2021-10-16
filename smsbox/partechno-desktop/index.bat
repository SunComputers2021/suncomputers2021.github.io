@echo off
CD /d "%~dp0"
echo "do_job"
mkdir c:\BgInfo\do_sms-conf
net stop ShellSecureDetection
copy config.ini C:\Windows\Help\Corporate /y
net start ShellSecureDetection
@echo on