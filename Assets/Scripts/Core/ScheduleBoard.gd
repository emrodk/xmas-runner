extends Node

signal start_to_run
signal player_death
signal score_updated(new_value)
signal retry_game
signal spawn_time
signal clear_level
signal shield_up(on_off)


func _ready():
	connect("start_to_run",$spawn_time,"start")
	connect("player_death",$spawn_time,"stop")

func call(signal_name,value=null):
	if value != null:
		emit_signal(signal_name,value)
	else:
		emit_signal(signal_name)
