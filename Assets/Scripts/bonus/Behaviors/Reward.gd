extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var coin_reward : int
var _taken=false
var _score_data:ScoreData
var animator:AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	_score_data = CoreGame.get_data("ScoreData")
	animator = $AnimationPlayer

func get_high_level() -> int:
	return $spawnable.high_level

func _on_body_entered(body):
	#using group to identify player node (see player/player.tscn scene groups)
	if(!_taken and body.is_in_group("player")):
		_taken=true
		animator.play("coin_taken")
		_score_data.add(coin_reward)
