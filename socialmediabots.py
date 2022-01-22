# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


import discord
from arrr import translate
#from random import choice
from time import sleep
import requests
import asyncio
from discord.ext import commands
import datetime
#import youtube_dl
from urllib import parse, request
import re
#from discord.voice_client import VoiceClient
#from discord import FFmpegPCMAudio
from discord.utils import get
#from covid_india import states
import requests, json
#import ffmpeg
#import os
#from random import randint
import random
import pyfiglet
from PyDictionary import PyDictionary
import emoji
bot = commands.Bot(command_prefix='>', description="This is a Helper Bot")



players = {}

list12 = []

while True:
    problems = (input("enter problems"))
    list12.append(problems)
    print(list12)
    choice = (input("adding more problems yes or no"))
    if choice =="no":
        break



@bot.command()
async def ping(ctx):
    await ctx.send(f'Pinging! {round(bot.latency * 1000)}ms')


@bot.command()
async def e(ctx, symbol):
    await ctx.send(emoji.emojize(":" + symbol + ":"))
    print(emoji.emojize(":" + symbol + ":"))
    await ctx.send("if it dosent output a em0ji then try using a different word, the names are given in the discord em0ji if u hover your cursor over the em0jis ")


@bot.command()
async def meaning(ctx, word):
    dictionary = PyDictionary()
    await ctx.send(dictionary.meaning(word))
    print(dictionary.meaning(word))

@bot.command()
async def translate(ctx, word, language):
    dictionary = PyDictionary()
    await ctx.send(dictionary.translate(word, language))



@bot.command()
async def info(ctx):
    embed = discord.Embed(title=f"{ctx.guild.name}", description="aaravomega's bot", timestamp=datetime.datetime.utcnow(), color=discord.Color.blue())
    embed.add_field(name="Server created at", value=f"{ctx.guild.created_at}")
    embed.add_field(name="Server Owner", value=f"{ctx.guild.owner}")
    embed.add_field(name="Server Region", value=f"{ctx.guild.region}")
    embed.add_field(name="Server ID", value=f"{ctx.guild.id}")
    # embed.set_thumbnail(url=f"{ctx.guild.icon}")
    embed.set_thumbnail(url="https://pluralsight.imgix.net/paths/python-7be70baaac.png")

    await ctx.send(embed=embed)



# Events
@bot.event
async def on_ready():
    await bot.change_presence(activity=discord.Streaming(name=">help (beta) (aaravomega's bot)", url="http://www.twitch.tv/accountname"))
    print('My code is ready')

@bot.command()
async def weather(ctx, CITY):
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    # City Name CITY = "Hyderabad"
    # API key API_KEY = "Your API Key"
    # upadting the URL
    API_KEY = ('24f16ede1e5d6c20602fcca9661d5261')
    URL = BASE_URL + "q=" + CITY + "&appid=" + API_KEY
    # HTTP request
    response = requests.get(URL)
    # checking the status code of the request
    if response.status_code == 200:
        # getting data in the json format
        data = response.json()
        # getting the main dict block
        main = data['main']
        # getting temperature
        temperature = main['temp']
        # getting the humidity
        humidity = main['humidity']
        # getting the pressure
        pressure = main['pressure']
        # weather report
        report = data['weather']
        await ctx.send(f"{CITY:-^30}")
        await ctx.send(f"Temperature: {temperature-273.15}C")
        await ctx.send(f"Humidity: {humidity}")
        await ctx.send(f"Pressure: {pressure}hPa")
        await ctx.send(f"Weather Report: {report[0]['description']}")
    else:
        # showing the error message
        await ctx.send("You have to type a city")



@bot.command()
async def status(ctx):
    for item in list12:
        await ctx.send(item)


class MemberRoles(commands.MemberConverter):
    async def convert(self, ctx, argument):
        member = await super().convert(ctx, argument)
        return [role.name for role in member.roles[1:]] # Remove everyone role!
@bot.command()
async def roles(ctx, *, member: MemberRoles):
    """Tells you a member's roles."""
    await ctx.send('I see the following roles: ' + ', '.join(member))


@bot.listen()
async def on_message(message):
    if "badwordfilter" in message.content.lower():
        # in this case don't respond with the word "Tutorial" or you will call the on_message event recursively
        await message.delete()






bot.run('NzQxODgxMzk5OTUwMTgwNDc0.Xy-A5Q.9r_iqHNsqUcWqwmY_d9vHBvttII')
