# 飞书机器人配置指南

> 适用于 hermes-agent v0.8+

---

## 前置要求

- ✅ Hermes Agent 已安装并运行
- ✅ 飞书开放平台账号
- ✅ 有权限创建企业自建应用

---

## 第一步：创建飞书应用

1. 访问 [飞书开放平台](https://open.feishu.cn/app)
2. 点击「创建企业自建应用」
3. 填写应用名称（如：我的 Hermes）
4. 点击「创建」

---

## 第二步：开启机器人能力

在应用详情页：
- 进入「应用功能」→「机器人」
- 确保已启用机器人

---

## 第三步：申请权限

在「权限管理」中申请以下权限：

| 权限标识 | 权限名称 | 用途 |
|---------|---------|------|
| `im:message:send_as_bot` | 发送消息 | 机器人发送消息 |
| `im:message:read` | 接收消息 | 接收用户消息 |
| `contact:user:readonly` | 通讯录只读 | 识别用户身份 |

点击「申请」后，等待审批通过（企业自建应用通常自动通过）。

---

## 第四步：获取凭证

在「凭证与基础信息」页面，获取：
- **App ID**
- **App Secret**

> 妥善保管，不要泄露给他人

---

## 第五步：配置 Hermes Gateway

在 Ubuntu 终端运行：

```bash
hermes gateway setup
```

交互式向导中：
- 选择 `feishu` 作为消息渠道
- 输入 App ID
- 输入 App Secret
- User IDs：留空表示所有用户可用，或输入指定用户ID
- Domain：`feishu`（中国大陆）
- Connection mode：选择 `websocket`（强烈推荐）

---

## 第六步：订阅事件

回到飞书开放平台：

1. 进入「事件与回调」
2. 订阅方式选择「**长连接**」（不需要公网IP）
3. 在「需要订阅的事件」中勾选：
   - `im.message.receive_v1`（接收消息）
4. 保存

---

## 第七步：测试

1. 在飞书中搜索你的应用名称
2. 向机器人发送一条消息，例如：「你好」
3. 应收到 Hermes Agent 的回复

---

## 常见问题

**Q: 机器人没有回复？**
A: 检查：
1. `hermes gateway logs` 查看实时日志
2. 飞书开放平台「事件与回调」中是否订阅了 `im.message.receive_v1`
3. 确认 App ID 和 App Secret 正确

**Q: 提示"无权访问"？**
A: 在飞书开放平台确认应用已发布，且你的用户在应用可用范围内。

**Q: 想让特定用户使用？**
A: 在 `hermes gateway setup` 的 User IDs 中填写指定用户的飞书 User ID。

---

## 下一步

配置完成后，运行以下命令启动飞书频道：

```bash
hermes gateway start --channel feishu
```

或配置为开机自启：

```bash
hermes gateway enable-autostart
```
