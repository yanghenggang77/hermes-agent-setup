@echo off
cd /d C:\Users\Administrator\hermes-agent-setup
git add .
git commit -m "fix: install.sh rewrite with uv PATH fix and post-install verification"
git push
echo SUCCESS
pause
