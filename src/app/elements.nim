# Custom NiGui ui elements

import nigui, browsers

type HyperLinkButton = ref object of Button

method handleDrawEvent(control: HyperLinkButton, event: DrawEvent) =
  let canvas = event.control.canvas
  canvas.areaColor = rgb(55, 55, 55, 0) # button background
  canvas.textColor = rgb(0, 0, 0) # text color
  canvas.lineColor = rgb(0, 0, 0) # button outline
  canvas.drawRectArea(0, 0, control.width, control.height)
  canvas.drawTextCentered(control.text)
  canvas.drawRectOutline(0, 0, control.width, control.height)

# Override nigui.newButton (optional)
proc newHyperLinkButton*(text = "", url = ""): Button =
  result = new HyperLinkButton
  result.init()
  result.onClick = proc (e: ClickEvent) =
    openDefaultBrowser(url)
  result.text = text