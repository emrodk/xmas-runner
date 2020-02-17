extends Node

const Hurdle=preload("res://Assets/Scripts/enemies/Hurdle/Hurdle.tscn")
const Rook=preload("res://Assets/Scripts/enemies/Rook/Rook.tscn")
const Bonus=preload("res://Assets/Scripts/bonus/Star.tscn")
const Shield=preload("res://Assets/Scripts/bonus/Shield/GuardShield.tscn")
const JumpPad=preload("res://Assets/Scripts/enemies/Pad/JumpPad.tscn")
#const Hole=preload("res://enemies/hole/Hole.tscn")
const Spawns:Dictionary = {0:"bonus",1:"hurdle",2:"rook",3:"JumpPad",4:"shield"}
onready var _enemies:Array = [Bonus,Hurdle,Rook,JumpPad,Shield]

func get_random_index() -> int:
	var enemies_count=Spawns.size()
	var rand_val:int
	return randi() % enemies_count

func get_enemy_name(index:int) -> String:
	return Spawns[index]

func get_random_enemy():
	return _enemies[get_random_index()]
