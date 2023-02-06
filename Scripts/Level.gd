extends Node
class_name Level

func initialise_level(player : Node, camera : Node, carriage : Node):
	SignalBus.request_dialogue.connect(open_dialogue)
	SignalBus.dialogue_scroll.connect(dialogue_scroll)
	SignalBus.dialogue_closed.connect(handle_closed_dialogue)
	
	carriage.top_door_triggered.connect(transition_up)
	carriage.bottom_door_triggered.connect(transition_down)	
	player.position = carriage.bottom_spawn.position if GameState.last_door_entered == "top" else carriage.top_spawn.position
	camera.initialise(player)


func transition_up():	
	print("hit top door")
	GameState.last_door_entered = "top"
	
	if GameState.current_carriage == "1":
		SceneChanger.change_scene("res://Scenes/PrototypeLevel2.tscn")
		GameState.current_carriage = "2"
		print("Entered Carriage 2")
	

func transition_down():
	print("hit bottom door")
	GameState.last_door_entered = "bottom"
	
	if GameState.current_carriage == "2":
		SceneChanger.change_scene("res://Scenes/Prototype.tscn")
		GameState.current_carriage = "1"
		print("Entered Carriage 1")


func open_dialogue(dialogue_key):
	#print(dialogue)
	#var dialogue_scene = load("res://Scenes/Dialogue.tscn")
	#var dialogue_instance = dialogue_scene.instantiate()
	GameState.is_reading = true
	HUD.show_dialogue(dialogue_key)


func dialogue_scroll():
	HUD.dialogue_scroll()
	

func handle_closed_dialogue():
	GameState.is_reading = false
