# 微信接入配置指南

> 基于 itchat 网页协议，适用于 hermes-agent

---

## ⚠️ 重要说明

微信网页协议存在以下限制：
- 微信账号可能被判定为机器人导致封号
- 无法使用微信支付相关功能
- 部分功能可能不稳定

**建议**：仅用于私域流量场景，正式企业用途推荐使用飞书。

---

## 前置要求

- ✅ Hermes Agent 已安装并运行
- ✅ 微信账号（建议使用专用账号，不要主号）
- ✅ Python 3.8+

---

## 安装依赖

```bash
pip install itchat-ua
```

或使用项目提供的依赖文件：

```bash
cd SCRIPTS
pip install -r requirements-wechat.txt
```

---

## 第一步：获取微信 QR 码登录

运行配置脚本：

```bash
python SCRIPTS/setup-wechat.py
```

或直接运行：

```bash
hermes gateway setup --channel wechat
```

终端会显示微信登录 QR 码，用微信扫描即可。

---

## 第二步：设置消息接收

登录成功后，微信账号自动绑定到 Hermes Agent。

---

## 第三步：测试

向你的微信账号发送「你好」，应收到 Hermes Agent 的回复。

---

## 常见问题

**Q: 扫码后提示「登录环境异常」？**
A: 微信安全机制拦截，建议：
1. 使用微信老账号（非新注册）
2. 先在网页版微信 (wx.qq.com) 登录一次
3. 保持账号活跃度

**Q: 账号被封了怎么办？**
A: 只能通过微信安全中心申诉，无法100%避免。建议使用专用账号。

**Q: 如何退出登录？**
A: 运行：
```bash
python SCRIPTS/logout-wechat.py
```

---

## 安全建议

1. **使用专用微信账号**，不要用主号
2. **不要频繁发送相同消息**，容易被判定为机器人
3. **定期备份聊天记录**
4. **关注微信安全通知**，及时处理异常

---

## 下一步

配置完成后，运行以下命令启动微信频道：

```bash
hermes gateway start --channel wechat
```

---

*遇到问题提交 Issue 或联系客服*
