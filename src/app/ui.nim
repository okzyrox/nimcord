import koi, nanovg


proc UI*(vg: NVGContext, winWidth, winHeight, fbWidth, fbHeight: int) =
    koi.beginFrame(winWidth, winHeight, fbWidth, fbHeight)
    # main ui code here gang
    var labelStyle = getDefaultLabelStyle()
    labelStyle.fontSize = 15.0
    labelStyle.color = white()
    koi.label("Hello Nimcord!", wsNormal, labelStyle)
    koi.endFrame()

    