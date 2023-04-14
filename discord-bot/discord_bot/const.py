import os

IS_PRODUCTION = bool(int(os.environ.get("IS_PRODUCTION", "0")))  # 0 or 1


if IS_PRODUCTION:
    DISCORD_TOKEN_SECRET = "projects/chibawest-gamecenter/secrets/discord-bot-api-token/versions/latest"
else:
    DISCORD_TOKEN_SECRET = "projects/chibawest-gamecenter/secrets/discord-bot-api-token-dev/versions/latest"
