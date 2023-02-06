extends Node

signal top_door_triggered()
signal bottom_door_triggered()

@onready var top_door = $TopDoor
@onready var bottom_door = $BottomDoor
@onready var top_spawn = $TopSpawnPoint
@onready var bottom_spawn = $BottomSpawnPoint


func _physics_process(delta):
	if Input.is_action_pressed("up"):
		for body in top_door.get_overlapping_bodies():
			if body.is_in_group("player"):
				top_door_triggered.emit()
	
	if Input.is_action_pressed("down"):
		for body in bottom_door.get_overlapping_bodies():
			if body.is_in_group("player"):
				bottom_door_triggered.emit()


func _on_top_door_body_entered(body):
	if body.is_in_group("player") and Input.is_action_pressed("up"):
		top_door_triggered.emit()


func _on_bottom_door_body_entered(body):
	if body.is_in_group("player") and Input.is_action_pressed("down"):
		bottom_door_triggered.emit()
