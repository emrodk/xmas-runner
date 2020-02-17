extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animator

# Called when the node enters the scene tree for the first time.
func _ready():
	animator = $RookBody/AnimationPlayer
	animator.play("default")
	pass

func get_high_level() -> int:
	return $spawnable.high_level

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		animator.play("bat_loop")
		pass

func _on_KillNode_body_entered(body):
	if body.is_in_group("player"):
		$RookBody.set_collision_layer_bit(0,false)
		$RookBody.set_collision_mask_bit(0,false)
		animator.play("death")
		body.bat_jump()


func _on_RookBody_body_entered(body):
	if(body.is_in_group("player")):
		$RookBody/KillNode.set_collision_layer_bit(0,false)
		$RookBody/KillNode.set_collision_mask_bit(0,false)
		body.kill()
