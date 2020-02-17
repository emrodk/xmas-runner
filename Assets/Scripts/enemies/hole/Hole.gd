extends "res://core/spawnable.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wait_for_ready = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#func dissapear():
#	if wait_for_ready:
#		wait_for_ready=false
#		return

func _on_body_entered( player ):
	if(player.is_in_group("player")):
		player.fall()
		player.kill()