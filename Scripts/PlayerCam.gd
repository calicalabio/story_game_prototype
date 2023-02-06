extends Node

@onready var camera = $Camera2D
@onready var bump_timer = $BumpTimer

var initialised : bool = false
var player : Node = null
var bump_step_size : float = 0.5
var max_bump_steps : float = 3.0
var current_bump_steps : float = 0.0
var is_bumping : bool = false
var max_bump_reached : bool = false

func _ready():
	pass


func _physics_process(delta):
	if initialised:
		try_bump()


func initialise(player_node : Node):
	player = player_node
	camera.position.x = player.position.x
	camera.position.y = player.position.y
	bump_timer.start()
	initialised = true


func try_bump():
	if player.is_moving:
		is_bumping = false
		max_bump_reached = false
		current_bump_steps = 0.0
	
	if not is_bumping:
		camera.position.y = player.position.y
	else:
		if not max_bump_reached:
			current_bump_steps += 1.0
			camera.position.y = player.position.y + (bump_step_size * current_bump_steps)			
			
			if current_bump_steps == max_bump_steps:
				max_bump_reached = true
		else:
			current_bump_steps -= 1.0
			camera.position.y = player.position.y + (bump_step_size * current_bump_steps)
						
			if current_bump_steps == 0.0:
				max_bump_reached = false
				is_bumping = false


func trigger_bump():
	is_bumping = true


func _on_bump_timer_timeout():
	trigger_bump()
