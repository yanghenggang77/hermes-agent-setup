# Hermes Agent 快速上手指南（5分钟入门）

> 适用于零基础用户，一步一步来，不需要技术背景

---

## 你需要准备什么？

- [ ] Windows 10 或 Windows 11 电脑
- [ ] 稳定的网络（能访问 GitHub）
- [ ] 大约 30 分钟的空余时间
- [ ] 一个淘宝/闲鱼购买的订单编号

---

## 第一步：检查你的电脑

按 `Win + R`，输入 `cmd`，回车，在弹出的黑窗口里输入：

```
systeminfo | findstr /B /C:"OS Name"
```

看到类似 `Windows 10` 或 `Windows 11` 就OK。

---

## 第二步：启用 WSL2（必读！）

**为什么要 WSL2？**
WSL2 就像在你的电脑上装一个 Linux 环境，Hermes Agent 需要 Linux 才能运行。别担心，图形界面和 Windows 一模一样。

### 2.1 打开 PowerShell（管理员）

在开始菜单上搜索 **PowerShell**，右键点击「以管理员身份运行」。

### 2.2 粘贴以下命令

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

看到提示 `[==========================100%]` 就是成功了。

### 2.3 重启电脑

这一步必须做！否则 WSL2 不会生效。

### 2.4 设置 WSL2 为默认

重启后，再次打开 PowerShell（普通用户即可，不是管理员也行），输入：

```powershell
wsl --set-default-version 2
```

然后安装 Ubuntu：

```powershell
wsl --install -d Ubuntu-22.04 --web-download
```

第一次打开会要求你创建用户名和密码，**请记住这个密码**，后面要用。

---

## 第三步：安装 Hermes Agent

打开 Ubuntu 终端（就是刚才装的那个 Ubuntu），粘贴以下命令：

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

等待大约 10-20 分钟，看到 `✅ 安装完成！` 就是成功了。

验证安装：

```bash
hermes --version
```

应该显示 `hermes 0.8.x`。

---

## 第四步：配置你的 AI 模型

运行：

```bash
hermes setup
```

按提示操作：

1. 选择你的模型提供商（推荐选 `openrouter`，一个 Key 通吃所有模型）
2. 输入你的 API Key
3. 选择一个默认模型

> 没有 API Key？去 https://openrouter.ai 注册，赠送免费额度

---

## 第五步：连接飞书或微信

### 飞书用户看这里：

1. 打开 [飞书开放平台](https://open.feishu.cn/app)，创建自建应用
2. 获取 App ID 和 App Secret
3. 在终端运行：`hermes gateway setup`，选择 `feishu`
4. 输入 App ID 和 App Secret

详细步骤：[FEISHU.md](FEISHU.md)

### 微信用户看这里：

1. 在终端运行：`hermes gateway setup`，选择 `wechat`
2. 用微信扫描二维码
3. 等待连接成功

详细步骤：[WECHAT.md](WECHAT.md)

---

## 第六步：开始使用！

恭喜你 🎉 到这里你的 Hermes Agent 已经跑起来了！

尝试发送：
- 「你好」
- 「帮我查一下北京的天气」
- 「给我讲个笑话」

看看 AI 怎么回复。

---

## 🆘 遇到问题？

| 问题 | 解决办法 |
|------|---------|
| 安装卡住了 | 重试一次，或联系客服远程协助 |
| hermes 命令找不到 | 运行 `source ~/.bashrc` 然后重试 |
| 飞书机器人不回复 | 检查 App ID 和 App Secret 是否正确 |
| 微信扫码失败 | 确保微信没有在其他地方登录 |

**联系客服**：提交 GitHub Issue 或联系淘宝客服

---

## 下一步

恭喜入门！现在你可以：

- 📚 学习更多命令：运行 `hermes --help`
- ⚙️ 配置更多渠道：[SETUP.md](SETUP.md)
- 🤖 让 AI 完成复杂任务：给它下达具体指令

---

*祝使用愉快！有问题随时联系客服*
