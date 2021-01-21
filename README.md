# Factorial
Discord integration for Factorio.

## Running
Factorial requires connectivity to both a Discord Bot and a webhook enabled in the appropriate channel. Ensure you have the following environment variables set:
1. `DISCORD_BOT_TOKEN`
2. `DISCORD_WEBHOOK_ID`
3. `DISCORD_WEBHOOK_TOKEN`

### Local
Run with `mix run --no-halt`

### Docker
1. Build with `docker build -t ghcr.io/jswny/factorial .`
2. Run with `docker run -it -e DISCORD_BOT_TOKEN -e DISCORD_WEBHOOK_ID -e DISCORD_WEBHOOK_TOKEN ghcr.io/jswny/factorial`

### Docker Compose
Run with `docker-compose up`
