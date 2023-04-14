"""
discordpy イベントリファレンス
https://discordpy.readthedocs.io/ja/latest/api.html#event-reference
"""
import discord

from discord_bot import const
from discord_bot.secretmanager import get_secret

intents = discord.Intents.default()
intents.message_content = True


class ChibawestGamecenterBot(discord.Client):
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


if __name__ == "__main__":
    discord_token = get_secret(const.DISCORD_TOKEN_SECRET)
    client = ChibawestGamecenterBot(intents=intents)
    client.run(discord_token)
