extends CanvasLayer

signal scene_changed()

@onready var animation_player = $AnimationPlayer
@onready var black_screen = $Control/Black

func change_scene(path, delay : float = 0.5):
	#await get_tree().create_timer(delay).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	assert(get_tree().change_scene_to_file(path) == OK)
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	scene_changed.emit()
	
