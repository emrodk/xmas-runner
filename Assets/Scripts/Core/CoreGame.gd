extends Node

var gpgs

func _ready():
	if OS.get_name() == "Android":
		if Engine.has_singleton("GooglePlay"):
			gpgs = Engine.get_singleton("GooglePlay")
			gpgs.init(get_instance_id()) # use get_instance_id () for Godot 3.X
			gpgs.login()

func get_data(data_name):
	return $DataBoard.get_data(data_name)

func _receive_message(from, key, data):
	if from == "GooglePlay":
		print("Key: ", key, " Data: ", data)
