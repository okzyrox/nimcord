# Channel objects
#god these have so many parameters and nonsense

from common import SnowFlakeId

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

type Channel* = object
    discard