extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var name_item:String=""
var _spawner : SpawnerSystem

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_spawner(spawner:SpawnerSystem):
	_spawner = spawner

func stop_spawn(stop:bool):
	_spawner.stop_object_spawn(stop)