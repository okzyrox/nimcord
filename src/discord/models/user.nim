# Discord User Data

from common import SnowFlakeId, Locale

type UserFlags = enum
    None = 0
    Staff = 1
    Partner = 2
    HypesquadEvents = 4
    BugHunterLevel1 = 8
    HouseBravery = 64
    HouseBrilliance = 128
    HouseBalance = 256
    NitroEarlySupporter = 512
    TeamUser = 1024
    BugHunterLevel2 = 16384
    VerifiedBot = 65536
    VerifiedBotDeveloper = 131072
    CertifiedModerator = 262144
    BotHttpInteractions = 524288
    ActiveDeveloper = 1073741824

type UserPremium* = enum
    None = 0
    NitroClassic = 1
    Nitro = 2
    NitroBasic = 3


type Service = enum
    None = 0
    battlenet = "Battle.net"
    bungie = "Bungie.net"
    ebay = "ebay"
    epicgames = "Epic Games"
    facebook = "Facebook"
    github = "GitHub"
    google = "Google"
    instagram = "Instagram"
    leagueoflegends = "League of Legends"
    reddit = "Reddit"
    riotgames = "Riot Games"
    spotify = "Spotify"
    skype = "Skype"
    steam = "Steam"
    tiktok = "TikTok"
    twitch = "Twitch"
    twitter = "Twitter (X)"
    xbox = "Xbox"
    youtube = "YouTube"

type ServiceVisibility = enum
    None = 0
    Everyone = 1


type Connection* = object
    id*: string
    name*: string
    connection_type*: Service
    revoked*: bool
    integrations*: seq[string] # non impl
    verified*: bool
    friend_sync*: bool
    show_activity*: bool
    visibility*: ServiceVisibility


type UserAvatarDecoration = object
    asset*: string # hash
    sku_id*: SnowFlakeId

type User* = object
    id*: SnowFlakeId
    username*: string
    discriminator*: string
    global_name*: string #display name
    avatar*: string # hash, a_ = animated
    bot*: bool
    system*: bool
    mfa_enabled*: bool
    banner*: string # hash
    accent_color*: uint # hex
    locale*: Locale
    verified*: bool
    email*: string
    flags*: UserFlags
    premium_type*: UserPremium
    public_flags*: UserFlags
    avatar_decoration*: UserAvatarDecoration # hash

    #
    connections*: seq[Connection]

