# Guild/Channel/DM Invites


from common import SnowFlakeId, Timestamp
from guild import Guild
from guild_channel import GuildChannel
from user import User


type InviteType = enum
    Guild = 0
    GroupDM = 1
    Friend

type InviteTargetType = enum
    Stream = 1
    EmbeddedApplication = 2

type Invite* = object
    inite_type*: InviteType
    code*: string #uid
    guild*: Guild
    channel*: GuildChannel
    inviter*: User
    target_type*: InviteTargetType
    target_user*: User
    target_application*: string # application (impl later)

    approximate_presence_count*: int
    approximate_member_count*: int

    expires_at*: Timestamp
    #stage_instance
    #guild_scheduled_event