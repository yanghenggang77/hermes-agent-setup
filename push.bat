@echo off
cd /d C:\Users\Administrator\hermes-agent-setup
git config user.name "yanghenggang77"
git config user.email "yanghenggang77@gmail.com"
git add .
git commit -m "initial commit"
git branch -M main
git push -u origin main
echo SUCCESS
pause
