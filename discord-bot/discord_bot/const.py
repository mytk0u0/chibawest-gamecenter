import os

IS_PRODUCTION = bool(int(os.environ.get("IS_PRODUCTION", "0")))  # 0 or 1
SECRET_NAME_FORMAT = "projects/chibawest-gamecenter/secrets/{name}/versions/latest"
SECRET_PATH_FORMAT = "/etc/{name}/secret"

if IS_PRODUCTION:
    DISCORD_TOKEN_SECRET_NAME = "discord-bot-api-token"
else:
    DISCORD_TOKEN_SECRET_NAME = "discord-bot-api-token-dev"
