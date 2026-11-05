# Proxy302 plugins for Claude

> **Official**, built and maintained by the Proxy302 team. [中文说明](README.zh-CN.md)

Give Claude a residential-proxy toolbox. This repository is a Claude Code plugin marketplace with one plugin, **proxy302**, which bundles:

- the hosted [Proxy302 MCP server](https://github.com/proxy302/proxy302-mcp) (`https://mcp.proxy302.com/mcp`, OAuth sign-in), and
- a **skill** that tells Claude when to reach for it and how to use each tool well.

With it, Claude can get a residential proxy URL for any country, state or city; check your traffic, balance and usage; list your proxies and static IPs; rotate sticky proxies to a new IP; check whether an IP is on blocklists; and quote what a plan would cost. It never buys, renews or tops up anything.

## Install in Claude Code

```text
/plugin marketplace add proxy302/proxy302-claude-plugins
/plugin install proxy302@proxy302
```

Then run `/mcp`, pick **proxy302** and sign in with a Proxy302 API key (`key id:secret`, create one at https://proxy302.com/api-keys). Deleting the key in the console disconnects Claude.

Try asking:

- "Give me a residential proxy in Germany and test it with curl."
- "How much traffic do I have left, and what did I use this week?"
- "List my static IPs and check whether any of them are blocklisted."
- "Rotate my US sticky proxy to a new IP."
- "What would 20 GB of residential traffic cost me?"

## Use the skill in Claude.ai or Claude Desktop

1. Download `proxy302-skill.zip` from the [latest release](https://github.com/proxy302/proxy302-claude-plugins/releases/latest).
2. In Claude, open **Settings → Capabilities → Skills** and upload the zip.
3. Add the connector: **Settings → Connectors → Add custom connector**, URL `https://mcp.proxy302.com/mcp`.

## Other MCP clients

Cursor, VS Code, Windsurf, ChatGPT and other MCP clients can use the same server directly. See the [proxy302-mcp README](https://github.com/proxy302/proxy302-mcp#hosted-server-no-install).

## What is in here

```text
.claude-plugin/marketplace.json          marketplace manifest
plugins/proxy302/.claude-plugin/plugin.json
plugins/proxy302/.mcp.json               hosted MCP server, OAuth
plugins/proxy302/skills/proxy302/SKILL.md
```

## Support

Account, billing or connection questions: [Proxy302 support](https://proxy302.com). Bugs in this plugin: [open an issue](https://github.com/proxy302/proxy302-claude-plugins/issues).

License: MIT.
