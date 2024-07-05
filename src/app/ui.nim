import koi, nanovg
import json

var
  sectionServers = false

  currentServer = ""
  sectionViewServer = false
  sectionViewServerChannelsList = false
  
  sectionFriends = false
  sectionFriendsPinned = false

var servers = @[
    "Server 1",
    "Server 2",
]

var channels = %*{
    "Server 1": @["Channel 1", "Channel 2", "Channel 3", "Channel 4"],
    "Server 2": @["Channel6", "Channel 7", "Channel 8", "Channel 9"],
}

proc UI*(vg: NVGContext, winWidth, winHeight, fbWidth, fbHeight: int) =
    koi.beginFrame(winWidth, winHeight, fbWidth, fbHeight)
    vg.beginPath()
    vg.rect(0, 0, winWidth.float, winHeight.float)
    vg.fillColor(nanovg.gray(0.5))
    vg.fill()
    # main ui code here gang
    var labelStyle = getDefaultLabelStyle()
    labelStyle.fontSize = 15.0
    labelStyle.color = white()

    koi.beginScrollView(x=0, y=0, w=350, h=600)

    var ap = DefaultAutoLayoutParams
    ap.rowWidth = 350
    ap.rightPad = 16
    ap.rowPad = 8

    initAutoLayout(ap)

    if koi.sectionHeader("Servers", sectionServers):
        for server in servers:
            # TODO: figure out how to pad the buttons properly
            
            if koi.button(server, "view " & server):
                sectionViewServer = true
                currentServer = server
    
    if koi.sectionHeader("Friends", sectionFriends):
        if koi.subSectionHeader("Pinned", sectionFriendsPinned):
            koi.label("Pinned Friend 1")
            koi.label("Pinned Friend 2")
        else:

            koi.label("Friend 1")
            koi.label("Friend 2")
            koi.label("Friend 3")
            koi.label("Friend 4")
    if currentServer != "":

        if koi.sectionHeader("Server", sectionViewServer):
            koi.label(currentServer)
            if koi.subSectionHeader("Channels", sectionViewServerChannelsList):
                for channel in channels[currentServer]:
                    koi.label(channel.getStr())
    
    koi.endScrollView()

    
        


    koi.endFrame()

    