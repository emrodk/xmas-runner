class_name ScoreData
extends Node

var _current_score:int # current score
var _best_score:int # max score
export var incress_factor:int

# Called when the node enters the scene tree for the first time.
func _ready():
	ScheduleBoard.connect("spawn_time",self,"add")
	ScheduleBoard.connect("start_to_run",self,"reset_score")

func add(new_value:int=incress_factor):
	_current_score += new_value
	if _best_score<_current_score:
		_best_score=_current_score
	ScheduleBoard.emit_signal("score_updated",_current_score)

func get_best_score() -> int:
	return _best_score

func get_score() -> int:
	return _current_score

func reset_score():
	_current_score=0
	ScheduleBoard.emit_signal("score_updated",_current_score)


