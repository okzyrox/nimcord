# Common datatypes

type SnowFlakeId* = uint64

type Locale* = enum
    id = "Indonesian"
    da = "Danish"
    de = "German"
    enGB = "English (UK)"
    enUS = "English (US)"
    esES = "Spanish"
    es419 = "Spanish (Latin America)"
    fr = "French"
    hr = "Croatian"
    it = "Italian"
    lt = "Lithuanian"
    hu = "Hungarian"
    nl = "Dutch"
    no = "Norwegian"
    pl = "Polish"
    ptBR = "Portuguese (Brazil)"
    ro = "Romanian"
    fi = "Finnish"
    svSE = "Swedish"
    tr = "Turkish"
    uk = "Ukrainian"
    vi = "Vietnamese"
    cs = "Czech"
    el = "Greek"
    bg = "Bulgarian"
    ru = "Russian"
    hi = "Hindi"
    th = "Thai"
    ko = "Korean"
    ja = "Japanese"
    zhCN = "Chinese (Simplified)"
    zhTW = "Chinese (Traditional)"

# iso 8601
type Timestamp* = string # can be null