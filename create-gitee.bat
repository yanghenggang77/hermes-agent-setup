@echo off
powershell -Command "Invoke-RestMethod -Uri 'https://gitee.com/api/v5/user/repos' -Method POST -Headers @{'Authorization'='token fb22411de576b3422bdddb01bed00342';'Content-Type'='application/json'} -Body '{\"name\":\"yhg_qubic\",\"description\":\"Hermes Agent\",\"private\":false}' | ConvertTo-Json"
echo DONE
pause
