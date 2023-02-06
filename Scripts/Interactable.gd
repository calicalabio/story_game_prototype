extends Node
class_name Interactable

var is_player_looking : bool = false

func enter_player():
	is_player_looking = true
	handle_player_entered()


func exit_player():
	is_player_looking = false
	handle_player_exited()


func handle_player_entered():
	pass

	
func handle_player_exited():
	pass


func _input(event : InputEvent):
	if not GameState.is_reading and is_player_looking and event.is_action_pressed("interact"):
		handle_interaction()
	elif GameState.is_reading and is_player_looking and event.is_action_pressed("interact"):
		scroll_dialogue()


func handle_interaction():
	pass


func open_dialogue(dialogue : String):
	SignalBus.request_dialogue.emit(dialogue)


func scroll_dialogue():
	SignalBus.dialogue_scroll.emit()
