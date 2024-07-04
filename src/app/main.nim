import glad/gl
import glfw
from glfw/wrapper import showWindow
import nanovg

import koi

var vg: NVGContext

import ui as screen_ui

proc createWindow(): Window =
  var cfg = DefaultOpenglWindowConfig
  # TODO
  cfg.size = (w: 1000, h: 800)
#  cfg.size = (w: 300, h: 300)
  cfg.title = "Koi Test"
  cfg.resizable = true
  cfg.visible = true
  cfg.bits = (r: 8, g: 8, b: 8, a: 8, stencil: 8, depth: 16)
#  cfg.transparentFramebuffer = true
#  cfg.focusOnShow = true
#  cfg.decorated = false
  cfg.nMultiSamples = 4

  when defined(macosx):
    cfg.version = glv32
    cfg.forwardCompat = true
    cfg.profile = opCoreProfile

  newWindow(cfg)


proc renderUI(winWidth, winHeight, fbWidth, fbHeight: int) =
  #[
  vg.beginPath()
  vg.rect(0, 0, winWidth.float, winHeight.float)
  vg.fillColor(nanovg.gray(0.5))
  vg.fill()
  screen_ui.UI(vg, winWidth, winHeight, fbWidth, fbHeight)]#
  koi.beginFrame(winWidth, winHeight, fbWidth, fbHeight)

  vg.beginPath()
  vg.rect(0, 0, winWidth.float, winHeight.float)
  vg.fillColor(gray(0.3))
  vg.fill()

  let
    w = 110.0
    h = 22.0
    pad = h + 8
  var
    x = 100.0
    y = 70.0

  var labelStyle = getDefaultLabelStyle()
  labelStyle.fontSize = 15.0
  labelStyle.color = gray(0.8)

  #  vg.scissor(0, 0, 630, 100)

  koi.label(x, y, 200, h, "Koi widget tests", style = labelStyle)

  # Buttons
  y += pad
  if koi.button(x, y, w, h, "Start", tooltip = "I am the first!"):
    echo "button 1 pressed"
  
  koi.endFrame()


proc init(): Window =
  glfw.initialize()

  var win = createWindow()

  nvgInit(getProcAddress)
  vg = nvgCreateContext({nifStencilStrokes, nifAntialias, nifDebug})

  if not gladLoadGL(getProcAddress):
    quit "Error initialising OpenGL"

  #loadData(vg)

  koi.init(vg, getProcAddress)

  #win.windowPositionCb = windowPosCb
  #win.framebufferSizeCb = framebufSizeCb

  glfw.swapInterval(1)

  win.pos = (400, 150) 
  wrapper.showWindow(win.getHandle())

  result = win


proc renderFrame(win: Window, res: tuple[w, h: int32] = (0,0)) =
  let
    (winWidth, winHeight) = win.size
    (fbWidth, fbHeight) = win.framebufferSize

  renderUI(winWidth, winHeight, fbWidth, fbHeight)

  glfw.swapBuffers(win)

proc cleanup() =
  koi.deinit()
  nvgDeleteContext(vg)
  glfw.terminate()


proc mainApp*() =
  let win = init()
  echo "Starting!"

  while not win.shouldClose: 
    if koi.shouldRenderNextFrame():
      glfw.pollEvents()

      if isKeyDown(keyEscape):
        echo "Closing!"
        win.shouldClose = true
    else:
      glfw.waitEvents()
    renderFrame(win)

  cleanup()