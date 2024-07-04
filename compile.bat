::--app:gui
nim c --gc:orc --deepcopy:on --d:nimPreviewFloatRoundtrip --d:nvgGL3 --d:glfwStaticLib --d:glStaticProcs --path:"." --hint:"Name:off" src/nimcord.nim