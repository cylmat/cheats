### RUN linux command

```
# git.bat

@echo off
set v_params=%*
set v_params=%v_params:\=/%
set v_params=%v_params:c:=/mnt/c%
set v_params=%v_params:"=\"%
@bash -c "git %v_params%"
```

### POWERSHELL

test connection
```
Test-NetConnection -ComputerName localhost -Port 54112
```

see actually port forwarding 
```
netsh interface portproxy show all
```

get port listener on windows
```
netstat -ano | findstr :54112
   TCP    0.0.0.0:54112          0.0.0.0:0              LISTENING       4400
```
```
tasklist /FI "PID eq 4400"
   or
Get-Process -Id 4400
```

