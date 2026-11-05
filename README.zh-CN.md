# Proxy302 Claude 插件

> **官方出品**，由 Proxy302 团队开发和维护。[English](README.md)

让 Claude 直接用上住宅代理。这个仓库是一个 Claude Code 插件市场，里面有一个插件 **proxy302**，包含：

- 官方托管的 [Proxy302 MCP 服务](https://github.com/proxy302/proxy302-mcp)（`https://mcp.proxy302.com/mcp`，登录授权）；
- 一个**技能（Skill）**，告诉 Claude 什么时候该用它、每个工具怎么用好。

装好以后，你可以让 Claude：

- 拿任意国家、州、城市的住宅代理地址；
- 查流量、余额和用量；
- 列出你的代理和静态 IP；
- 给固定会话的代理换一个新 IP；
- 查 IP 有没有上黑名单；
- 算某个套餐要花多少钱。

它不会替你购买、续费或充值。

## 在 Claude Code 里安装

```text
/plugin marketplace add proxy302/proxy302-claude-plugins
/plugin install proxy302@proxy302
```

装好后：

1. 运行 `/mcp`，选 **proxy302**，用 Proxy302 API 密钥登录。密钥格式是 `密钥 ID:密钥`，在 https://proxy302.com/api-keys 创建。
2. 以后在控制台删掉这个密钥，Claude 就会断开连接。

可以这样问：

- 「给我一个德国的住宅代理，用 curl 测一下」
- 「我还剩多少流量？这周用了多少？」
- 「列出我的静态 IP，看看有没有上黑名单的」
- 「把我那个美国固定会话代理换个新 IP」
- 「买 20 GB 住宅流量要多少钱？」

## 在 Claude 网页版或桌面版里用这个技能

1. 从[最新发布](https://github.com/proxy302/proxy302-claude-plugins/releases/latest)下载 `proxy302-skill.zip`。
2. 在 Claude 里打开 **设置 → 功能 → 技能**，上传这个 zip。
3. 添加连接器：**设置 → 连接器 → 添加自定义连接器**，地址填 `https://mcp.proxy302.com/mcp`。

## 其他 MCP 客户端

Cursor、VS Code、Windsurf、ChatGPT 等也能直接接同一个服务，见 [proxy302-mcp 说明](https://github.com/proxy302/proxy302-mcp/blob/main/README.zh-CN.md)。

## 支持

- 账户、计费、连接问题：联系 [Proxy302 客服](https://proxy302.com)。
- 插件本身的问题：[提 issue](https://github.com/proxy302/proxy302-claude-plugins/issues)。

许可证：MIT。
