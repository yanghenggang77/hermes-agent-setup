# HEARTBEAT.md Template

```markdown
# Keep this file empty (or with only comments) to skip heartbeat API calls.

# Add tasks below when you want the agent to check something periodically.
```

## Self-Improving Check

- Read `C:\Users\Administrator\.openclaw\workspace\skills\self-improving\heartbeat-rules.md`
- Use `C:\Users\Administrator\self-improving\heartbeat-state.md` for last-run markers and action notes
- If no file inside `C:\Users\Administrator\self-improving\` changed since the last reviewed change, return `HEARTBEAT_OK`
