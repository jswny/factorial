# Factorial
Discord integration for Factorio.

## Configuration
| Name | Required? | Description | Default |
|-|-|-|-|
| `DISCORD_BOT_TOKEN` | **Yes** | The token for the associated Discord bot | N/A |
| `DISCORD_WEBHOOK_ID` | **Yes** | The ID for the Discord webhook | N/A |
| `DISCORD_WEBHOOK_TOKEN` | **Yes** | The token for the Discord webhook | N/A |
| `COMMAND_PREFIX` | No | The command prefix for commands initiated through messages | `/f` |

## Running

### Local
Run with `mix run --no-halt`

### Docker
1. Build with `docker build -t ghcr.io/jswny/factorial .`
2. Run with `docker run -it -e DISCORD_BOT_TOKEN -e DISCORD_WEBHOOK_ID -e DISCORD_WEBHOOK_TOKEN -e COMMAND_PREFIX ghcr.io/jswny/factorial`

### Docker Compose
Run with `docker-compose up`

## Tests
Run the tests with `mix test`
