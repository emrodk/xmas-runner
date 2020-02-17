extends Node2D

export (NodePath) var root_path
var root
export var high_level:int


func _ready():
	root= get_node_or_null(root_path)
	ScheduleBoard.connect("clear_level",self,"dissapear")

#when node go off screen memory is freed
func _on_visibility_notifier_exit_screen():
	root.queue_free()

func dissapear():
	root.queue_free()
