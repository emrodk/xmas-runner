extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _taken=false
export var duration:int
var animator:AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animator = $AnimationPlayer

func get_high_level() -> int:
	return $spawnable.high_level

func _on_body_entered(body):
	#using group to identify player node (see player/player.tscn scene groups)
	if(!_taken and body.is_in_group("player")):
		_taken=true
		animator.play("shield_taken")
		body.shield_up(duration)
#		_spawner.stop_object_spawn("shield",true)
