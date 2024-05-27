# Channel objects
#god these have so many parameters and nonsense

from common import SnowFlakeId
from user import User
from voice_state import VoiceRegion

type ChannelType = enum
    GuildText = 0
    DM = 1
    GuildVoice = 2
    Group_DM = 3
    GuildCategory = 4
    GuildAnnouncement = 5
    AnnouncementThread = 6
    PublicThread = 7
    PrivateThread = 8
    GuildStageVoice = 9
    # api v9
    GuildDirectory = 10
    GuildForum = 11
    GuildMedia = 12

type ChannelVideoQualityMode = enum
    Auto = 1
    Full = 2 # 720

type ChannelFlags = enum
    # cba to do bitwise
    Pinned = 1 # 1 << 1 - pinned to forum or media
    RequireTag = 2 # 1 << 4 - if tag needed to create
    HideMediaDownloadOptions = 3 # 1 << 15 - media channe; onl;y

type ChannelSortOrder = enum
    LatestActivity = 0
    CreationDate = 1


type ChannelPermissionOverwrites = object
    id: SnowFlakeId
    overwrite_type: int # 0(role), 1(member)
    allow: int # bitset permissions
    deny: int # bitset permissions

# Forums (forum and media channel types)
type ForumLayoutTypes = enum
    NotSet = 0
    List = 1
    Grid = 2 # "gallery"

type ForumTag = object
    id: SnowFlakeId
    name: string
    moderated: bool # can be only added by MANAGE_THREADS perms
    emojiId: SnowFlakeId
    emojiName: string

type ForumDefaultReaction = object
    emojiId: SnowFlakeId
    emojiName: string

# embeds later

# 

type ChannelPermission = enum
    CreateInstantInvite = 0
    KickMembers = 1
    BanMembers = 2
    Administrator = 3
    ManageChannels = 4
    ManageGuild = 5
    AddReactions = 6
    ViewAuditLog = 7
    PrioritySpeaker = 8
    Stream = 9
    ViewChannel = 10
    SendMessages = 11
    SendTTSMessages = 12
    ManageMessages = 13
    EmbedLinks = 14
    AttachFiles = 15
    ReadMessageHistory = 16
    MentionEveryone = 17
    UseExternalEmojis = 18
    ViewGuildInsights = 19
    Connect = 20
    Speak = 21
    MuteMembers = 22
    DeafenMembers = 23
    MoveMembers = 24
    UseVAD = 25
    ChangeNickname = 26
    ManageNicknames = 27
    ManageRoles = 28
    ManageWebhooks = 29
    ManageEmojis = 30 # includes soundboards, stickers
    UseApplicationCommands = 31
    RequestToSpeak = 32
    ManageEvents = 33
    ManageThreads = 34
    CreatePublicThreads = 35
    CreatePrivateThreads = 36
    UseExternalStickers = 37
    SendMessagesInThreads = 38
    UseEmbeddedActivities = 39
    ModerateMembers = 40
    # tbh i dont even know how this looks so i have no clue how im gonna 
    # recreate it whenever i figure out what ui library i want to use 
    # because they are all terrible
    ViewCreatorMonetizationAnalytics = 41 
    UseSoundboard = 42
    CreateEmojis = 43
    CreateEvents = 44
    UseExternalSounds = 45
    SendVoiceMessages = 46
    SendPolls = 47

type UserChannelPermissions = object # self
    id: SnowFlakeId # the channel id (although might change to impl ref to channel if easier)
    allow: seq[ChannelPermission]
    deny: seq[ChannelPermission]

type GuildChannel* = object
    id*: SnowFlakeId
    channel_type*: ChannelType
    guild_id*: SnowFlakeId # guild id
    position*: int
    permission_overwrites*: seq[ChannelPermissionOverwrites]
    name*: string
    topic*: string
    nsfw*: bool
    last_message_id*: SnowFlakeId # applies to FORUM + MEDIA
    # voice channel only
    bitrate*: int #vc
    user_limit*: int #vc
    rate_limit_per_user*: int #0-21600
    # dm only
    recipents*: seq[User]
    icon*: string # hash
    owner_id*: SnowFlakeId
    application_id*: SnowFlakeId #if dm is made by bot
    managed*: bool # managed by oauth2
    #
    parent_id*: SnowFlakeId # parent channel category
    last_pin_timestamp*: int # discord says null if no pin

    #vc only
    rtc_region*: VoiceRegion
    video_quality_mode*: ChannelVideoQualityMode

    message_count*: int
    member_count*: int
    
    #threads
    # thread_metadata
    # thread_member

    default_auto_archive_duration*: int
    #permissions*: string
    flags*: ChannelFlags
    
    default_reaction_emoji*: ForumDefaultReaction
    default_sort_order*: ChannelSortOrder
    default_forum_layout*: ForumLayoutTypes
    available_tags*: seq[ForumTag]
    default_reaction_emoji_id*: SnowFlakeId