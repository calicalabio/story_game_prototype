extends CharacterBody2D

@export var speed : float = 150.0
@onready var player_sprite = $PlayerSprite

var diag_forgiveness_frames : int = 3
var frames_since_diag : int = diag_forgiveness_frames
var last_player_direction : String = "down"
var last_diag_player_direction : String = ""
var is_moving : bool = false
var has_received_input : bool = false

func _ready():
	if GameState.last_door_entered == "top":
		player_sprite.update_animation("up", is_moving)
	elif GameState.last_door_entered == "bottom":
		player_sprite.update_animation("down", is_moving)


func _process(delta):
	pass


func _physics_process(delta):
	if not GameState.is_reading:
		move_player()


func move_player():
	var input_velocity = Vector2()
	is_moving = true	
	
	if Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		input_velocity.x -= 1
		input_velocity.y -= 1	
		last_player_direction = "up_left"
		last_diag_player_direction = "up_left"
		frames_since_diag = 0
	elif Input.is_action_pressed("up") and Input.is_action_pressed("right"):
		input_velocity.x += 1
		input_velocity.y -= 1	
		last_player_direction = "up_right"
		last_diag_player_direction = "up_right"
		frames_since_diag = 0
	elif Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		input_velocity.x -= 1
		input_velocity.y += 1	
		last_player_direction = "down_left"
		last_diag_player_direction = "down_left"
		frames_since_diag = 0
	elif Input.is_action_pressed("down") and Input.is_action_pressed("right"):
		input_velocity.x += 1
		input_velocity.y += 1	
		last_player_direction = "down_right"
		last_diag_player_direction = "down_right"
		frames_since_diag = 0
	elif Input.is_action_pressed("up"):
		input_velocity.y -= 1
		frames_since_diag += 1		
		last_player_direction = "up" #if frames_since_diag >= diag_forgiveness_frames else last_player_direction
	elif Input.is_action_pressed("down"):
		input_velocity.y += 1		
		frames_since_diag += 1
		last_player_direction = "down" #if frames_since_diag >= diag_forgiveness_frames else last_player_direction
	elif Input.is_action_pressed("left"):
		input_velocity.x -= 1
		frames_since_diag += 1			
		last_player_direction = "left" #if frames_since_diag >= diag_forgiveness_frames else last_player_direction
	elif Input.is_action_pressed("right"):
		input_velocity.x += 1
		frames_since_diag += 1		
		last_player_direction = "right" #if frames_since_diag >= diag_forgiveness_frames else last_player_direction
	else:
		if frames_since_diag < diag_forgiveness_frames:
			last_player_direction = last_diag_player_direction
			
		is_moving = false
	
	if is_moving:
		has_received_input = true
		
	if Input.is_action_pressed("left"):
		player_sprite.update_facing("left")	
	elif Input.is_action_pressed("right"):
		player_sprite.update_facing("right")	
	
	if has_received_input:
		player_sprite.update_animation(last_player_direction, is_moving)
		input_velocity = input_velocity.normalized() * speed
		velocity = input_velocity
		move_and_slide()
