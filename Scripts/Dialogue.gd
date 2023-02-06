extends Node

@onready var panel = $Panel
@onready var title = $Panel/Title
@onready var dialogue = $Panel/Dialogue
@onready var timer = $Panel/Timer

var text_speed : float = 0.07
var dialogue_content : Array = []
var phrase_num : int = 0
var finished_printing_phrase : bool = true

func reset_dialogue():
	phrase_num = 0
	dialogue_content = []
	finished_printing_phrase = true


func show_dialogue(dialogue_key : String):
	reset_dialogue()
	timer.wait_time = text_speed
	dialogue_content = DialogueLibrary.dialogue[dialogue_key]
	self.visible = true
	scroll_dialogue()


func scroll_dialogue():
	if not finished_printing_phrase:
		dialogue.visible_characters = len(dialogue.text)
	else:
		if phrase_num >= len(dialogue_content):
			close_dialogue()		
		else:
			finished_printing_phrase = false		
			title.bbcode_text = dialogue_content[phrase_num]["Title"]
			dialogue.bbcode_text = dialogue_content[phrase_num]["Text"]
			dialogue.visible_characters = 0
			
			while dialogue.visible_characters < len(dialogue.text):
				dialogue.visible_characters += 1
				timer.start()
				await timer.timeout
		
			finished_printing_phrase = true
			phrase_num += 1
	

func close_dialogue():
	self.visible = false	
	SignalBus.dialogue_closed.emit()
