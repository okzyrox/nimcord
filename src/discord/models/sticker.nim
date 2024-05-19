# Stickers (aka images with meta)

from common import SnowFlakeId

type StickerType = enum
    Standard = 1
    Guild = 2

type StickerFormatType = enum
    PNG = 1
    APNG = 2
    Lottie = 3
    GIF = 4

type Sticker* = object
    id*: SnowFlakeId
    pack_id*: SnowFlakeId
    name*: string
    description*: string
    tags*: string # autocomplete tags, not implementing
    sticker_type*: StickerType
    format_type*: StickerFormatType
    available*: bool
    guild_id*: SnowFlakeId
    user*: SnowFlakeId # creator
    sort_value*: int # sorting order

# used to get stickers with little data (partial)
type StickerItem = object
    id*: SnowFlakeId
    name*: string
    format_type*: StickerFormatType

type StickerPack = object
    id*: SnowFlakeId
    stickers*: seq[StickerItem]
    name*: string
    sku_id*: SnowFlakeId
    cover_sticker_id*: SnowFlakeId
    description*: string
    banner_asset_id*: SnowFlakeId
