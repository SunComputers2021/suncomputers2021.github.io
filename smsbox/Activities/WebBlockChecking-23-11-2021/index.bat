@echo off
set filename=webcheck.ps1
echo $curdir = $pwd > %tmp%\%filename%
echo $URLListFile = "$env:userprofile\desktop\URLList.txt" >> %tmp%\%filename%
echo $URLList = Get-Content $URLListFile -ErrorAction SilentlyContinue >> %tmp%\%filename%

echo $WORKING = "$env:userprofile\desktop\URLList_WORKING.txt" >> %tmp%\%filename%
echo if (Test-Path $WORKING)  >> %tmp%\%filename%
echo { >> %tmp%\%filename%
echo  Remove-Item $WORKING >> %tmp%\%filename%
echo } >> %tmp%\%filename%

echo $BLOCKED = "$env:userprofile\desktop\URLList_BLOCKED.txt" >> %tmp%\%filename%
echo if (Test-Path $BLOCKED)  >> %tmp%\%filename%
echo {  >> %tmp%\%filename%
echo   Remove-Item $BLOCKED >> %tmp%\%filename%
echo } >> %tmp%\%filename%

#For every URL in the list
echo Foreach($Uri in $URLList) { >> %tmp%\%filename%
echo    $Status = 0 >> %tmp%\%filename%
echo    Try { >> %tmp%\%filename%
echo     $Response = Invoke-WebRequest -Uri $Uri -ErrorAction Stop >> %tmp%\%filename%
echo     $Status = $Response.StatusCode >> %tmp%\%filename%
echo     write-output "$Status - $Uri" ^| add-content $WORKING >> %tmp%\%filename%
echo    } >> %tmp%\%filename%
echo   Catch {  >> %tmp%\%filename%
echo   $Status = 404 >> %tmp%\%filename%
echo   write-output "$Status - $Uri" ^| add-content $BLOCKED >> %tmp%\%filename%
echo    } >> %tmp%\%filename%
echo   Write-Host $Status - $Uri >> %tmp%\%filename%
echo } >> %tmp%\%filename%
cls
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%tmp%\webcheck.ps1'"
del %tmp%\webcheck.ps1
@echo on