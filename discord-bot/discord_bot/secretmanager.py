import os
import tempfile

from google.cloud import secretmanager

from discord_bot import const

SECRET_MOUNT_PATH = "/etc"
TEMPFILE_PREFIX = "discord-bot-"


def get_secret(secret_name: str) -> str:
    secret_path = const.SECRET_PATH_FORMAT.format(name=secret_name)
    if not os.path.exists(secret_path):
        client = secretmanager.SecretManagerServiceClient()
        request = secretmanager.AccessSecretVersionRequest(name=const.SECRET_NAME_FORMAT.format(name=secret_name))
        response = client.access_secret_version(request=request)
        with tempfile.NamedTemporaryFile(prefix=TEMPFILE_PREFIX, delete=False) as fp:
            fp.write(response.payload.data)
        secret_path = fp.name
    with open(secret_path, "r") as f:
        return f.read()
