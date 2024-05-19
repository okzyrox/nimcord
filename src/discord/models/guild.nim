# Guilds (servers)

from common import SnowFlakeId, Locale
from emoji import Emoji
from sticker import Sticker
from guild_role import GuildRole

#https://discord.com/developers/docs/resources/guild#guild-object-guild-features
type GuildFeatures* = enum
    Unknown # not settable/retrievable
    AnimatedBanner
    AnimatedIcon
    ApplicationCommandPermissionsV2
    AutoModeration
    Banner
    Community # mut
    CreatorMonetizeableProvisional
    CreatorStorePage
    DeveloperSupportPage
    Discoverable # mut
    Featureable
    InvitesDisabled # mut
    InviteSplash
    MemberVerificationGateEnabled
    MoreStickers
    News
    Partnered
    PreviewEnabled
    RaidAlertsEnabled # mut
    RoleIcons
    RoleSubscriptionsAvailableForPurchase
    RoleSubscriptionsEnabled
    TicketedEventsEnabled
    VanityUrl
    Verified
    VIPRegions
    WelcomeScreenEnabled

proc toString*(f: GuildFeatures): string =
    case f:
        of GuildFeatures.AnimatedBanner: "ANIMATED_BANNER"
        of GuildFeatures.AnimatedIcon: "ANIMATED_ICON"
        of GuildFeatures.ApplicationCommandPermissionsV2: "APPLICATION_COMMAND_PERMISSIONS_V2"
        of GuildFeatures.AutoModeration: "AUTO_MODERATION"
        of GuildFeatures.Banner: "BANNER"
        of GuildFeatures.Community: "COMMUNITY"
        of GuildFeatures.CreatorMonetizeableProvisional: "CREATOR_MONETIZABLE_PROVISIONAL"
        of GuildFeatures.CreatorStorePage: "CREATOR_STORE_PAGE"
        of GuildFeatures.DeveloperSupportPage: "DEVELOPER_SUPPORT_PAGE"
        of GuildFeatures.Discoverable: "DISCOVERABLE"
        of GuildFeatures.Featureable: "FEATURABLE"
        of GuildFeatures.InvitesDisabled: "INVITES_DISABLED"
        of GuildFeatures.InviteSplash: "INVITE_SPLASH"
        of GuildFeatures.MemberVerificationGateEnabled: "MEMBER_VERIFICATION_GATE_ENABLED"
        of GuildFeatures.MoreStickers: "MORE_STICKERS"
        of GuildFeatures.News: "NEWS"
        of GuildFeatures.Partnered: "PARTNERED"
        of GuildFeatures.PreviewEnabled: "PREVIEW_ENABLED"
        of GuildFeatures.RaidAlertsEnabled: "RAID_ALERTS_ENABLED"
        of GuildFeatures.RoleIcons: "ROLE_ICONS"
        of GuildFeatures.RoleSubscriptionsAvailableForPurchase: "ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE"
        of GuildFeatures.RoleSubscriptionsEnabled: "ROLE_SUBSCRIPTIONS_ENABLED"
        of GuildFeatures.TicketedEventsEnabled: "TICKETED_EVENTS_ENABLED"
        of GuildFeatures.VanityUrl: "VANITY_URL"
        of GuildFeatures.Verified: "VERIFIED"
        of GuildFeatures.VIPRegions: "VIP_REGIONS"
        of GuildFeatures.WelcomeScreenEnabled: "WELCOME_SCREEN_ENABLED"
        else: "Unknown"

proc toGuildFeatures*(s: string): GuildFeatures =
    case s:
        of "ANIMATED_BANNER": GuildFeatures.AnimatedBanner
        of "ANIMATED_ICON": GuildFeatures.AnimatedIcon
        of "APPLICATION_COMMAND_PERMISSIONS_V2": GuildFeatures.ApplicationCommandPermissionsV2
        of "AUTO_MODERATION": GuildFeatures.AutoModeration
        of "BANNER": GuildFeatures.Banner
        of "COMMUNITY": GuildFeatures.Community
        of "CREATOR_MONETIZABLE_PROVISIONAL": GuildFeatures.CreatorMonetizeableProvisional
        of "CREATOR_STORE_PAGE": GuildFeatures.CreatorStorePage
        of "DEVELOPER_SUPPORT_PAGE": GuildFeatures.DeveloperSupportPage
        of "DISCOVERABLE": GuildFeatures.Discoverable
        of "FEATURABLE": GuildFeatures.Featureable
        of "INVITES_DISABLED": GuildFeatures.InvitesDisabled
        of "INVITE_SPLASH": GuildFeatures.InviteSplash
        of "MEMBER_VERIFICATION_GATE_ENABLED": GuildFeatures.MemberVerificationGateEnabled
        of "MORE_STICKERS": GuildFeatures.MoreStickers
        of "NEWS": GuildFeatures.News
        of "PARTNERED": GuildFeatures.Partnered
        of "PREVIEW_ENABLED": GuildFeatures.PreviewEnabled
        of "RAID_ALERTS_ENABLED": GuildFeatures.RaidAlertsEnabled
        of "ROLE_ICONS": GuildFeatures.RoleIcons
        of "ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE": GuildFeatures.RoleSubscriptionsAvailableForPurchase
        of "ROLE_SUBSCRIPTIONS_ENABLED": GuildFeatures.RoleSubscriptionsEnabled
        of "TICKETED_EVENTS_ENABLED": GuildFeatures.TicketedEventsEnabled
        of "VANITY_URL": GuildFeatures.VanityUrl
        of "VERIFIED": GuildFeatures.Verified
        of "VIP_REGIONS": GuildFeatures.VIPRegions
        of "WELCOME_SCREEN_ENABLED": GuildFeatures.WelcomeScreenEnabled
        else: GuildFeatures.Unknown

type GuildSystemChannelFlags = enum
    Suppress

type GuildPreview = object # used when joining a server via emoji or discovery
    id*: SnowFlakeId
    name*: string
    icon*: string # hash
    splash*: string # hash
    discovery_splash*: string # hash
    emojis*: seq[Emoji] # hash
    features*: seq[GuildFeatures]
    approximate_member_count*: int
    approximate_presence_count*: int
    description*: string

type GuildMessageNotificationLevel = enum
    AllMessages = 0
    OnlyMentions = 1

type ExplicitContentFilter = enum
    Disabled = 0
    MembersWithoutRoles = 1
    AllMembers = 2

type MFALevel = enum # mod actions
    None = 0
    Elevated = 1

type VerificationLevel = enum
    None = 0
    Low = 1
    Medium = 2
    High = 3
    VeryHigh = 4

type GuildNSFWLevel = enum
    Default = 0
    Explicit = 1
    Safe = 2
    AgeRestricted = 3

type GuildPremiumTier = enum # server boosts
    None = 0
    Tier1 = 1
    Tier2 = 2
    Tier3 = 3

type GuildWelcomeScreenChannel = object
    channel_id*: SnowFlakeId
    description*: string
    emoji_id*: SnowFlakeId # emoji id
    emoji_name*: string

type GuildWelcomeScreen = object
    description*: string
    welcome_channels*: seq[GuildWelcomeScreenChannel]


type Guild = object
    id*: SnowFlakeId
    name*: string
    icon*: string # hash
    splash*: string # hash
    discovery_splash*: string # hash
    owner*: bool # for self user
    owner_id*: SnowFlakeId
    permissions*: int # bitwise permissions (PAIN)
    afk_channel_id*: SnowFlakeId
    afk_timeout*: int # seconds
    widget_enabled*: bool
    widget_channel_id*: SnowFlakeId
    verification_level*: VerificationLevel
    default_message_notifications*: GuildMessageNotificationLevel
    explicit_content_filter*: ExplicitContentFilter
    roles*: seq[GuildRole]
    emojis*: seq[Emoji]
    features*: seq[GuildFeatures]
    mfa_level*: MFALevel
    system_channel_id*: SnowFlakeId
    system_channel_flags*: GuildSystemChannelFlags
    rules_channel_id*: SnowFlakeId
    max_presences*: int # only applies to large servers
    max_members*: int # only applies to large servers
    vanity_url_code*: string
    description*: string
    banner*: string # hash
    premium_tier*: GuildPremiumTier
    premium_subscription_count*: int
    preferred_locale*: string
    public_updates_channel_id*: SnowFlakeId
    max_video_channel_users*: int
    approximate_member_count*: int
    approximate_presence_count*: int
    welcome_screen*: GuildWelcomeScreen
    nsfw_level*: GuildNSFWLevel
    stickers*: seq[Sticker]
    premium_progress_bar_enabled: bool
    safety_alerts_channel_id: SnowFlakeId



#[guild widgets later]#