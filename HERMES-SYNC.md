# OpenClaw Agent Status & Memory Sync
Generated: 2026-05-13 13:34 GMT+8
Last Updated: 2026-05-13 05:34 UTC

---

## Agent Identity

**Name**: OpenClaw Assistant
**Runtime**: OpenClaw CLI on Windows (BF-202605100910)
**Model**: minimax/MiniMax-M2.7
**Gateway**: http://127.0.0.1:18789
**Workspace**: C:\Users\Administrator\.openclaw\workspace

---

## Skills Status

**Total Installed**: 193 skills

**Skills Directory**: C:\Users\Administrator\.openclaw\workspace\skills\

**Recently Added (2026-05-13)**:
- skill-vetter (安全审计)
- tavily (AI搜索)
- openclaw-backup (备份还原)
- bb-browser (浏览器复用⚠️)
- daily-report (日报生成)
- browser-automation (自动化)

**Note**: bb-browser flagged by VirusTotal as suspicious (crypto keys, eval patterns)

---

## Memory Status

### Lithtrix Cloud Memory
- **API Key**: ltx_fd99ce640f7e14154f8109ab8f8428cf
- **Tier**: Spark ($5 credits, ~1000 searches)
- **Stored**: 115 bytes / 5MB limit
- **Operations**: 5 this month / 1000 limit

**Stored Keys**:
| Key | Value | Updated |
|-----|-------|---------|
| agent-info | { configured: true, agent: "openclaw", skills_count: 191, setup_date: "2026-05-13" } | 2026-05-13T04:59:54Z |

### Local Memory
- **Location**: C:\Users\Administrator\.openclaw\workspace\memory\
- **Status**: Empty (initialized but no data written yet)
- **Structure**: MEMORY.md + daily logs (YYYY-MM-DD.md)

### SQLite Memory
- **Location**: C:\Users\Administrator\.openclaw\memory\main.sqlite
- **Status**: Empty (0 chunks, 0 files)

---

## GitHub Sync

**Repository**: https://github.com/yanghenggang77/hermes-agent-setup
**Branch**: master

**Committed Files**:
1. `openclaw-context.md` - Initial context (v1)
2. `HERMES-SKILLS-MEMORY.md` - Full skills documentation (v2)
3. `skills/skill-vetter/` - Security audit skill
4. `skills/tavily/` - AI search skill
5. `skills/openclaw-backup/` - Backup skill
6. `skills/bb-browser/` - Browser reuse (⚠️ suspicious)
7. `skills/daily-report/` - Daily report skill
8. `skills/browser-automation/` - Browser automation skill

---

## Connected Services

### GitHub
- **Username**: yanghenggang77
- **Token**: Stored in GITHUB_TOKEN env var
- **Status**: Connected ✅

### Lithtrix Memory
- **Service**: https://api.lithtrix.ai
- **Status**: Active ✅
- **Credits**: $4.9999 remaining

---

## Configuration

```json
{
  "gateway": {
    "port": 18789,
    "mode": "local",
    "bind": "loopback",
    "auth": { "mode": "token" }
  },
  "models": {
    "primary": "minimax/MiniMax-M2.7"
  }
}
```

---

## Quick Reference

**Check Skills**: `Get-ChildItem C:\Users\Administrator\.openclaw\workspace\skills | Measure-Object`
**Check Memory**: `node openclaw.mjs memory search <query>`
**Backup Config**: `node openclaw.mjs backup create`
**List Skills**: `clawhub explore --limit 200`

---

*Synced from OpenClaw for Hermes Agent*