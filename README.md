# wsl-com

`com转dev.bat`是一个用于在 Windows Subsystem for Linux 2 (WSL 2) 中管理主机串口的工具，它利用了 usbipd-win 和 linux-tools-generic hwdata，通过简单的脚本实现了与主机串口的连接和管理。

## 安装 USBIPD-WIN 项目

WSL 本身并不支持连接 USB 设备，因此在使用 wsl-com 之前，你需要安装开源项目 usbipd-win。

1. 转到 usbipd-win 项目的最新发布页：[https://github.com/dorssel/usbipd-win/releases](https://github.com/dorssel/usbipd-win/releases)
2. 在发布页中选择一个合适的 .msi 文件，该文件将下载安装程序。（你可能会收到一条警告，要求你确认你信任此下载）
3. 按照安装向导完成安装过程。

## 安装 hwdata

在 WSL 终端中，执行以下命令进行安装：

```shell
sudo apt install linux-tools-generic hwdata
sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20
```
## 运行com转dev.bat

双击运行即可，之后应该会在wsl2中的ubuntu中看到/dev/ttyUSB0，这就是主机连接的串口。
