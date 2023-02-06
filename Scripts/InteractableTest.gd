extends Interactable


func handle_player_entered():
	#print("player entered interactable")
	pass
	
	
func handle_player_exited():
	#print("player left interactable")
	pass
	

func handle_interaction():
	#print("player requested dialogue!")
	open_dialogue("TestDialogue01")
