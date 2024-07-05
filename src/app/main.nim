import glad/gl
import glfw
from glfw/wrapper import showWindow
import nanovg

import koi

var vg: NVGContext

import ui as screen_ui

proc createWindow(): Window =
  var cfg = DefaultOpenglWindowConfig
  cfg.size = (w: 1200, h: 1100)
  cfg.title = "Nimcord"
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
  screen_ui.UI(vg, winWidth, winHeight, fbWidth, fbHeight)


proc loadResources(vg: NVGContext) =
  let regularFont = vg.createFont("sans", "resources/Roboto-Regular.ttf")
  if regularFont == NoFont:
    quit "Could not add font italic.\n"

  let boldFont = vg.createFont("sans-bold", "resources/Roboto-Bold.ttf")
  if boldFont == NoFont:
    quit "Could not add font italic.\n"

proc init(): Window =
  glfw.initialize()

  var win = createWindow()

  nvgInit(getProcAddress)
  vg = nvgCreateContext({nifStencilStrokes, nifAntialias, nifDebug})

  if not gladLoadGL(getProcAddress):
    quit "Error initialising OpenGL"

  loadResources(vg)

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