# Guild roles

from common import SnowFlakeId

type RoleTags = object
    bot_id*: SnowFlakeId
    integration_id*: SnowFlakeId
    premium_subscriber*: bool # discord responds with "null" if true
    subscription_listing_id*: SnowFlakeId
    purchasable*: bool
    guild_connections*: bool

type RoleFlags* = enum
    # cba to make this a bitfield
    None = 0
    InPrompt = 1

type GuildRole* = object
    id*: SnowFlakeId
    name*: string
    color*: int # hex
    hoist*: bool # hoist = visible above other roles
    position*: int
    permissions*: int
    managed*: bool # integration
    mentionable*: bool
    tags*: RoleTags
    #flags*: bitfield of flags