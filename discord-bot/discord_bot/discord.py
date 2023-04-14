"""
discord.py README.ja.rst
https://github.com/Rapptz/discord.py/blob/master/README.ja.rst

discordpy イベントリファレンス
https://discordpy.readthedocs.io/ja/latest/api.html#event-reference
"""
import discord

intents = discord.Intents.default()
intents.message_content = True


class ChibawestGamecenterBot(discord.Client):
    def __init__(self) -> None:
        super().__init__(intents=intents)

    async def on_message(self, message: discord.message.Message) -> None:
        if message.author.bot:
            return
        elif message.content == "!cmd":
            await message.channel.send(
                "\n".join(
                    [
                        "!cmd ... botが利用可能なコマンドを表示する",
                        "!repos ... アプリケーションのGitHubリポジトリを表示する",
                    ]
                )
            )
        elif message.content == "!repos":
            await message.channel.send("https://github.com/mytk0u0/chibawest-gamecenter")
