class_name OneTime
extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _clock:int
var _delta_clock:float
var _duration:int
signal timeout(name)
var _signal_name:String


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_delta_clock+=delta
	if _delta_clock>1:
		_clock+=1
		_delta_clock-=1
		if _clock == _duration:
			emit_signal("timeout",_signal_name)
			_clock=0
			set_process(false)

func start(duration:int,name:String):
	_duration=duration
	_signal_name=name
	set_process(true)
