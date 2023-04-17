# discord-bot

とくれせんたぼーびのDiscord Botの中身です。

## セットアップ (macOS)

前提として[pyenv](https://github.com/pyenv/pyenv)と[poetry](https://python-poetry.org/docs/)のコマンドを使えるようにしておいてください。

```bash
pyenv install 3.10.6
poetry self update 1.4.2
poetry config virtualenvs.in-project true
poetry install
```

## VSCodeの設定

.vscode/settings_examle.jsonをコピーして使ってください

```bash
cp .vscode/settings_example.json .vscode/settings.json
```

## 動作確認の手順

```bash
poetry run uvicorn main:app --host 0.0.0.0 --port 8080 --reload
```

## デプロイ

masterのmainリポジトリが更新されると自動でデプロイされますが、以下のように手動でデプロイすることもできます (やっていることは同じです)。

```bash
gcloud builds submit . --config cloudbuild.yaml
```
