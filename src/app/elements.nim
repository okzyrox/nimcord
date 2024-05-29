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


proc newHyperLinkButton*(text = "", url = ""): Button =
  result = new HyperLinkButton
  result.init()
  result.onClick = proc (e: ClickEvent) =
    openDefaultBrowser(url)
  result.text = text


type ImageButton = ref object of ControlImpl
  image: Image


method handleDrawEvent(control: ImageButton, event: DrawEvent) =
  let canvas = control.canvas
  let image = control.image

  canvas.drawImage(image, 0, 0, control.width, control.height)


method handleClickEvent(control: ImageButton, event: ClickEvent) =
  procCall control.ControlImpl.handleClickEvent(event)
  echo "button presse"
  control.forceRedraw


proc newImageButton*(image: Image): ImageButton =
  result = new ImageButton
  result.image = image
  result.init()
  

type ImageTextAlign* = enum
  Left
  Right

type ImageButtonWithText = ref object of ControlImpl
  image: Image
  text: string
  align: ImageTextAlign


method handleDrawEvent(control: ImageButtonWithText, event: DrawEvent) =
  let canvas = control.canvas
  let image = control.image
  let text = control.text
  
  if control.align == Left:
    canvas.drawImage(image, 0, 0, control.width, control.height)
    canvas.drawText(text, 0, 0)
  else:
    canvas.drawText(text, 0, 0)
    canvas.drawImage(image, 0, 0, control.width, control.height)
  #canvas.drawImage(image, 0, 0, control.width, control.height)


method handleClickEvent(control: ImageButtonWithText, event: ClickEvent) =
  procCall control.ControlImpl.handleClickEvent(event)
  echo "button presse"
  control.forceRedraw


proc newImageButtonWithText*(image: Image, text: string, align: ImageTextAlign = Left): ImageButtonWithText =
  result = new ImageButtonWithText
  result.image = image
  result.text = text
  result.align = align
  result.init()