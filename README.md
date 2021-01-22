# Factorial
Discord integration for Factorio.

## Configuration
| Name | Required? | Description | Default |
|-|-|-|-|
| `DISCORD_BOT_TOKEN` | **Yes** | The token for the associated Discord bot | N/A |
| `DISCORD_WEBHOOK_ID` | **Yes** | The ID for the Discord webhook | N/A |
| `DISCORD_WEBHOOK_TOKEN` | **Yes** | The token for the Discord webhook | N/A |
| `DATABASE_HOSTNAME` | No | The hostname for the Postgres database | `localhost` |
| `DATABASE_USERNAME` | No | The username for the Postgres database | `postgres` |
| `DATABASE_PASSWORD` | No | The password for the Postgres database | `postgres` |
| `COMMAND_PREFIX` | No | The command prefix for commands initiated through messages | `/f` |

## Running

### Local
Run with `mix run --no-halt`

### Docker
Run with `docker-compose up`

## Tests
Run the tests with `mix test`
