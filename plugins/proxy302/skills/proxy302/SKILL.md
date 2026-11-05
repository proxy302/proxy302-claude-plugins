---
name: proxy302
description: Use when the user wants a residential proxy or IP for a country, state or city; asks about their Proxy302 traffic, balance, proxies or static IPs; wants a sticky IP rotated; wants to know whether an IP is clean or blocklisted; asks what a proxy plan would cost; or needs a proxy wired into curl, Python, Node, Playwright, Puppeteer or an antidetect browser. Trigger phrases include "give me a US proxy", "residential IP for Germany", "how much traffic do I have left", "list my static IPs", "change my IP", "is this IP clean", "how much would 10 GB cost", "use a proxy for this scraper".
---

# Proxy302

Proxy302 sells residential proxies (dynamic, billed per GB), static residential (ISP) IPs, static data center IPs and dedicated ISP IPs for AI subscriptions. This plugin connects Claude to the official Proxy302 MCP server at `https://mcp.proxy302.com/mcp`.

## First run

The server needs the user's Proxy302 API key once:

1. If a `proxy302` tool call fails with an auth error, tell the user to run `/mcp`, pick **proxy302** and sign in.
2. The sign-in page asks for an API key in the form `key id:secret`. They create one at https://proxy302.com/api-keys.
3. Deleting the key in the console disconnects Claude.

## Which tool for which request

| The user wants | Call |
|---|---|
| Balance, remaining traffic, usage over the last N days | `get_account_usage` |
| Which countries, states or cities can be targeted | `list_countries`, then `list_regions` |
| What Proxy302 sells and the prices on their account | `list_products` |
| A working residential proxy for a place | `get_dynamic_proxy` |
| Their existing proxies or static IPs | `list_my_proxies` |
| A new exit IP on a sticky proxy | `rotate_ip` |
| Whether an IP is clean (blocklist score) | `check_ip_purity` |
| What a plan would cost and whether the wallet covers it | `estimate_cost` |

## How to work

- **Reuse before creating.** `get_dynamic_proxy` returns a proxy the user already has for that country when one exists. Only pass `create_if_missing=true` after telling the user a new proxy will be created. Creating it is free; traffic is billed per GB once they use it.
- **Budget or premium.** `line` defaults to `budget` (lower price per GB). Suggest `premium` when the user reports blocks or captchas on the budget line.
- **HTTP or SOCKS5.** Default to `http`. Use `socks5` only when the user's tool needs it or they ask for it.
- **Credentials.** `list_my_proxies` masks passwords. Pass `include_credentials=true` only when the user needs the full connection string, and do not repeat credentials more often than needed.
- **Rotation.** `rotate_ip` takes the token ids from `list_my_proxies` or `get_dynamic_proxy`. Username and password stay the same, and the new IP applies within about 2.5 minutes. Tell the user to wait before testing.
- **Purity.** `check_ip_purity` accepts one of the user's static IPs, or a place (to preview the IPs Proxy302 would hand out next there). Report the score in plain words: clean, listed on some blocklists, or not yet checked.
- **Money.** The server never buys, renews or tops up. For purchases, quote with `estimate_cost`, then send the user to https://proxy302.com. Prices are in PTC (1 PTC = 1 USD).

## Wiring a proxy into code

Use the `connection_url` (`http://user:pass@host:port` or `socks5://...`) that the tool returns:

```bash
curl -x "$PROXY_URL" https://ipinfo.io/json
```

```python
import requests
proxies = {"http": PROXY_URL, "https": PROXY_URL}
print(requests.get("https://ipinfo.io/json", proxies=proxies, timeout=30).json())
```

```js
// Playwright
const browser = await chromium.launch({ proxy: { server: `http://${host}:${port}`, username, password } });
```

Keep credentials in an environment variable or a `.env` file that is ignored by git, never hard-coded in committed code.

## When something fails

- **407 Proxy Authentication Required**: the username or password is wrong, or the proxy expired. Check it with `list_my_proxies`.
- **Timeouts or many captchas**: try `rotate_ip` (sticky proxies) or the `premium` line.
- **Wrong country**: check the proxy's area in `list_my_proxies`, or get one for the right country with `get_dynamic_proxy`.
- **Out of traffic or balance**: `get_account_usage` shows what is left. Top up in the console.

For account, billing or connection problems the tools cannot solve, point the user to Proxy302 support at https://proxy302.com.
