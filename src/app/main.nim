
import nigui
app.init()

proc mainAreaContent*(): LayoutContainer =
  var main_area_container = newLayoutContainer(Layout_Horizontal)
  main_area_container.xAlign = XAlign_Right

  var dms_list_scroll_area = newLayoutContainer(Layout_Vertical)
  dms_list_scroll_area.maxWidth = 200
  dms_list_scroll_area.padding = 20

  var dms_label = newLabel("Direct Messages")
  dms_list_scroll_area.add(dms_label)

  for i in 0..<10:
    var button = newButton("DM " & $i)
    button.width = 150
    dms_list_scroll_area.add(button)
  
  var friends_scroll_area = newLayoutContainer(Layout_Vertical)
  friends_scroll_area.maxWidth = 450
  friends_scroll_area.padding = 20

  var friends_label = newLabel("Friends")
  friends_scroll_area.add(friends_label)
  
  for i in 0..<10:
    var button = newButton("Friend Name Here!!! " & $i)
    button.width = 150
    friends_scroll_area.add(button)
  
  main_area_container.add(dms_list_scroll_area)
  main_area_container.add(friends_scroll_area)

  return main_area_container

proc main*() =
  var window = newWindow("Nimcord")

  window.width = 1100.scaleToDpi
  window.height = 900.scaleToDpi


  var main_container = newLayoutContainer(Layout_Horizontal)
  #main_container.widthMode = WidthMode_Expand
  #main_container.heightMode = HeightMode_Expand
  window.add(main_container)

  var side_container = newLayoutContainer(Layout_Vertical)
  side_container.heightMode = HeightMode_Expand
  side_container.xAlign = XAlign_Left
  side_container.maxWidth = 100

  var button = newButton("Test1")
  side_container.add(button)


  # Create a container to put inside the ScrollArea
  var server_list_container = newLayoutContainer(Layout_Vertical)

  for i in 0..<45:
    var button = newButton("Server " & $i)
    #button.onClick = proc (e: MouseEvent) =
    #  echo "Button ", i, " clicked"
    server_list_container.add(button)


  side_container.add(server_list_container)

  


  main_container.add(side_container)
  main_container.add(mainAreaContent())


  window.show()
  app.run()