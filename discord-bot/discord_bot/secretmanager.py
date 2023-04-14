from google.cloud import secretmanager

client = secretmanager.SecretManagerServiceClient()


def get_secret(secret_name: str) -> str:
    """Secret Managerから値を取得する

    Args:
        secret_name (str): シークレットの名前
    Returns:
        str: シークレットの値
    """
    request = secretmanager.AccessSecretVersionRequest(name=secret_name)
    response = client.access_secret_version(request=request)
    return response.payload.data.decode("utf-8")
