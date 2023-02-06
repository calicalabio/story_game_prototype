extends Marker2D

func _ready():
	if GameState.last_door_entered == "top":
		self.rotation = deg_to_rad(180)
	elif GameState.last_door_entered == "bottom":
		self.rotation = deg_to_rad(0)
				

func _physics_process(delta):
	if not GameState.is_reading:
		if Input.is_action_pressed("up") and Input.is_action_pressed("left"):
			self.rotation = deg_to_rad(135)
		elif Input.is_action_pressed("up") and Input.is_action_pressed("right"):
			self.rotation = deg_to_rad(-135)
		elif Input.is_action_pressed("down") and Input.is_action_pressed("left"):
			self.rotation = deg_to_rad(45)
		elif Input.is_action_pressed("down") and Input.is_action_pressed("right"):
			self.rotation = deg_to_rad(-45)
		elif Input.is_action_pressed("up"):
			self.rotation = deg_to_rad(180)
		elif Input.is_action_pressed("down"):
			self.rotation = deg_to_rad(0)
		elif Input.is_action_pressed("left"):
			self.rotation = deg_to_rad(90)
		elif Input.is_action_pressed("right"):
			self.rotation = deg_to_rad(-90)


func _on_area_2d_body_entered(body):
	if body is Interactable:
		body.enter_player()


func _on_area_2d_body_exited(body):
	if body is Interactable:
		body.exit_player()
