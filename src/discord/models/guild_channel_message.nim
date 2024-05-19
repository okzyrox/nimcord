# channel messages

from common import SnowFlakeId, Timestamp

from user import User
from guild_role import GuildRole

# partial impl of message for now

type MessageType = enum
    ## Message types change how messages are supposed to look when rendered
    ## most are system (i.e. no user, just text)
    ## some are client only
    ## some are specific to one user (warnings)
    ## etc
    Default = 0
    RecipientAdd = 1
    RecipientRemove = 2
    Call = 3
    ChannelNameChange = 4
    ChannelIconChange = 5
    ChannelPinnedMessage = 6
    UserJoin = 7
    GuildBoost = 8
    GuildBoostTier1 = 9
    GuildBoostTier2 = 10
    GuildBoostTier3 = 11
    ChannelFollowAdd = 12
    GuildDiscoveryDisqualified = 14
    GuildDiscoveryRequalified = 15
    GuildDiscoveryGracePeriodInitialWarning = 16
    GuildDiscoveryGracePeriodFinalWarning = 17
    ThreadCreated = 18
    Reply = 19
    ApplicationCommand = 20
    ThreadStarterMessage = 21
    GuildInviteReminder = 22
    ContextMenuCommand = 23
    AutoModerationAction = 24
    RoleSubscriptionPurchase = 25
    InteractionPremiumUpsell = 26
    StageStart = 27
    StageEnd = 28
    StageSpeaker = 29
    StageTopic = 30
    GuildApplicationPremiumSubscription

type MessageReference = object
    message_id*: SnowFlakeId
    channel_id*: SnowFlakeId
    guild_id*: SnowFlakeId

type Message* = object
    id*: SnowFlakeId
    channel_id*: SnowFlakeId
    author*: User
    content*: string
    timestamp*: Timestamp
    edited_timestamp*: Timestamp
    tts*: bool
    mention_everyone*: bool
    mentions*: seq[User]
    mention_roles*: seq[GuildRole]
    #mention_channels*: seq[]
    #attachments*: seq[]
    #embeds*: seq[Embed]
    #reactions*: seq[Reaction]
    nonce*: string # validate if sent
    pinned*: bool
    webhook_id*: SnowFlakeId
    message_type*: MessageType
    #activity*: Activity
    #application*: Application
    #application_id*: SnowFlakeId
    message_reference*: MessageReference # cant recurse
    # do the rest at a later point