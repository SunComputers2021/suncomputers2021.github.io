@echo off
CD /d "%~dp0"
net stop TermService
subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" /setowner=%userdomain%\everyone
subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" /grant=%userdomain%\everyone=F
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" /va /f
net start TermService
@echo on