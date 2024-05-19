# Emoji (emotes)

from common import SnowFlakeId
from guild_role import GuildRole

type Emoji* = object
    id*: SnowFlakeId
    name*: string
    roles*: seq[GuildRole]
    creator*: SnowFlakeId # 'user'
    require_colons*: bool
    managed*: bool
    animated*: bool
    available*: bool # false if no server boosts

