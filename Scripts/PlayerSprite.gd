extends AnimatedSprite2D

var facing : String = "left"

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func update_facing(direction : String):
	if direction == "left" or direction == "right":
		facing = direction
		flip_h = false if direction == "left" else true
		
		
func update_animation(direction : String, is_moving : bool):
	if direction == "up_left":
		animation = "up_diag_walk" if is_moving else "up_diag_idle"
	elif direction == "up":
		animation = "up_walk" if is_moving else "up_idle"
	elif direction == "up_right":
		animation = "up_diag_walk" if is_moving else "up_diag_idle"
	elif direction == "left":
		animation = "side_walk" if is_moving else "side_idle"
	elif direction == "right":
		animation = "side_walk" if is_moving else "side_idle"
	elif direction == "down_left":
		animation = "down_diag_walk" if is_moving else "down_diag_idle"
	elif direction == "down":
		animation = "down_walk" if is_moving else "down_idle"
	elif direction == "down_right":
		animation = "down_diag_walk" if is_moving else "down_diag_idle"
