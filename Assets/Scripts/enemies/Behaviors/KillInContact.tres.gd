extends Area2D

func get_high_level() -> int:
	return $spawnable.high_level

func _on_body_entered( body ):
	if(body.is_in_group("player")):
		body.kill()
