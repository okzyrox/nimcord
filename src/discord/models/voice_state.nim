# voice connection (no not the actual speaking stuff lmao)

from common import SnowFlakeId, Timestamp
from user import User

type VoiceRegion* = object
    id*: string
    name*: string
    optimal*: bool #(client only)
    deprecated*: bool #(client only)
    custom*: bool # events/etc

type VoiceState* = object
    guild_id*: SnowFlakeId
    channel_id*: SnowFlakeId
    user_id*: SnowFlakeId
    member*: User
    session_id*: string

    deaf*: bool
    mute*: bool
    self_deaf*: bool
    self_mute*: bool
    self_stream*: bool
    self_video*: bool
    suppress*: bool
    
    request_to_speak_timestamp*: Timestamp