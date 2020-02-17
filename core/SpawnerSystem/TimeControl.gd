class_name TimeControl
extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _clock:int
var _delta_clock:float
export var _duration:int
export var one_shoot:bool
signal timeout(signal_name)
export var signal_name:String 


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_delta_clock+=delta
	if _delta_clock>1:
		_clock += 1
		_delta_clock -= 1
		if _clock == _duration:
			emit_signal("timeout",signal_name)
			_clock=0
			if one_shoot :
				set_process(false)

func start():
	set_process(true)

func stop():
	set_process(false)
	_delta_clock = 0
	_clock = 0
