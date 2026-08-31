# webhook-sandbox

Throwaway repo for firing GitHub webhook deliveries at the Request Bin app
during development. Not part of the capstone deliverable.

## Setup

1. Create an **empty** repo on GitHub (no README/license), e.g. `webhook-sandbox`.
2. Wire it up:

   ```bash
   git remote add origin git@github.com:<you>/webhook-sandbox.git
   git add -A && git commit -m "init"
   git push -u origin main
   ```

3. Expose the Request Bin app and grab a bin id (see the app's README for ngrok).
4. In the GitHub repo: **Settings -> Webhooks -> Add webhook**
   - Payload URL: `https://<your-ngrok-domain>/b/<binId>`
   - Content type: `application/json`
   - Secret: leave empty for now
   - Events: "Just the push event" (or "Send me everything")
   - Add webhook -> GitHub immediately sends a `ping`; it should appear in the bin.

## Firing test events

```bash
./commit.sh        # one commit + push
./commit.sh 5      # five commits in one push
```

Each run appends a line to `log.txt` so every commit has a real diff.
