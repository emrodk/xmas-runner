extends Node

var _board:Dictionary


func _ready():
	for data in get_children():
		_board[data.name] = data

func get_data(data_name):
	if _board.has(data_name):
		return _board[data_name]
