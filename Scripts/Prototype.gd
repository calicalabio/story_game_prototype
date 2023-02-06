extends Level

@onready var player = $Player
@onready var camera = $PlayerCam
@onready var carriage = $Carriage

func _ready():
	initialise_level(player, camera, carriage)
	

func _process(delta):
	pass


func _physics_process(delta):
	pass
