# Uing imported via main module src\app\main.nim
import std/with
proc makeServersListBox*(): Box =
    result = newHorizontalBox(true)

    let serversBox = newVerticalBox(true)
    serversBox.add newLabel("Server 1")
    serversBox.add newLabel("Server 2")
    serversBox.add newLabel("Server 3")
    serversBox.add newLabel("Server 4")
    serversBox.add newLabel("Server 5")

    
    result.add serversBox