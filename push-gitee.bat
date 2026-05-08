@echo off
cd /d C:\Users\Administrator\hermes-agent-setup
git remote remove gitee
git remote add gitee https://gitee.com/yanghenggang/yhg_qubic.git
git config credential.helper manager
git push gitee main --force
echo DONE
pause
