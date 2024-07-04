# Discord stuffs

import json, strutils, httpclient, strformat

const API_URL = "https://discord.com/api/v10"

let DISCORD_URLS = @[
    "https://discord.com",
    "https://discord.gg",
    "https://discordapp.com",
    "https://canary.discord.com",
    "https://canary.discordapp.com",
    #Media
    "https://media.discordapp.com",
    "https://cdn.discordapp.com",
    "https://cdn.discord.com"
]

type ClientRequestConfig = object
    auth: string
    os: string
    os_version: string
    browser: string
    browser_version: string
    timezone: string
    user_agent: string

proc newClientRequestConfig(): ClientRequestConfig =
    result.auth = "wuh oh"
    result.os = "Windows"
    result.os_version = "10"
    result.browser = "Chrome"
    result.browser_version = "125.0.0.0"
    result.timezone = "Europe/London"
    result.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"

proc toJson(config: ClientRequestConfig): JsonNode =
    result = %*{
        "auth": config.auth,
        "os": config.os,
        "os_version": config.os_version,
        "browser": config.browser,
        "browser_version": config.browser_version,
        "timezone": config.timezone,
        "user_agent": config.user_agent
    }

var Client* = newClientRequestConfig()



proc MakeRequest(client, endpoint: string) =
    var client_details = Client.toJson()

    var request = newHttpClient()

    request.headers = newHttpHeaders({
        "Content-Type": "application/json",
        "User-Agent": $client_details["user_agent"],
        "Authorization": $client_details["auth"]
    })