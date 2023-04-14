# discord-bot

## セットアップ (macOS)

前提として[pyenv](https://github.com/pyenv/pyenv)と[poetry](https://python-poetry.org/docs/)のコマンドを使えるようにしておいてください。  

```bash
pyenv install 3.10.6
poetry self update
poetry config virtualenvs.in-project true
poetry install
```

## 動作確認の手順

```python
poetry run python -m discord_bot.main
```
