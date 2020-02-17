extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var coin_path:NodePath
var coin
var animator:AnimationPlayer

func get_high_level() -> int:
	return $spawnable.high_level

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _ready():
	coin = get_node_or_null(coin_path)
	animator = $AnimationPlayer
	

func _on_body_entered( body ):
	if(body.is_in_group("player")):
		body.kill()

func _on_StartAnimation_body_entered( body ):
	if(body.is_in_group("player")):
		animator.play("shrink")
