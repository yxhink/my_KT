@echo off
setlocal
set REPOS=%1
set TXN=%2
rem check that logmessage contains at least 10 characters
svnlook log "%REPOS%" -t "%TXN%" | findstr ".........." > nul
if %errorlevel% gtr 0 goto err
exit 0
:err
echo 提交时请填写完整的备注信息，不允许留空备注信息栏! 1>&2
exit 1