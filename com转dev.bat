@echo off

REM 执行 usbipd wsl list 命令并将输出保存到临时文件
usbipd wsl list > usbipd_output.txt

REM 查找包含 "USB-SERIAL CH340" 的行，并提取对应的 BUSID
for /f "tokens=1,*" %%A in ('type usbipd_output.txt ^| find "USB-SERIAL CH340"') do (
    set BUSID=%%A
)

REM 如果找到了 BUSID，则执行 usbipd wsl attach 命令
if not "%BUSID%"=="" (
    usbipd wsl attach --busid %BUSID%
) else (
    echo "未找到 USB-SERIAL CH340 的 BUSID。"
)

REM 删除临时文件
del usbipd_output.txt

REM 暂停脚本的执行，以便查看输出结果
pause
