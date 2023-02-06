extends CanvasLayer

@onready var dialogue_box = $Dialogue

func show_dialogue(dialogue_key : String):
	dialogue_box.show_dialogue(dialogue_key)


func dialogue_scroll():
	dialogue_box.scroll_dialogue()	
