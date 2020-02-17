class_name TimeController
extends Node2D

#For counting time

var _clock:int
var _delta_clock:float
var _max_freq:int
var _max_value:int

signal timeout(signal_name)

export var subscribers:Dictionary
var _counters:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	enabled(false)
	_max_value=subscribers.keys().max()
	for key in subscribers.keys():
		_counters[key] = 0

func _process(delta):
	_delta_clock+=delta
	if _delta_clock>1:
		_delta_clock-=1
		for key in _counters.keys():
			var count:int = _counters[key]
			if count + 1 == key:
				_counters[key]=0
				emit_signal("timeout",subscribers[count + 1])
			elif count + 1 < key:
				_counters[key] = count + 1

func enabled(on_off:bool):
	self.set_process(on_off)

func _on_MovingNode_stop_moving():
	enabled(false)
