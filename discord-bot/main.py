import asyncio

from fastapi import FastAPI

from discord_bot import const
from discord_bot.discord import ChibawestGamecenterBot
from discord_bot.secretmanager import get_secret

app = FastAPI()
client = ChibawestGamecenterBot()


@app.on_event("startup")
async def startup():
    discord_token = get_secret(const.DISCORD_TOKEN_SECRET_NAME)
    asyncio.create_task(client.start(discord_token))


@app.get("/")
async def root():
    return {"message": "chibawest-gamecenter-bot is running."}
