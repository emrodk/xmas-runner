class_name SpawnerSystem
extends Node2D

export (NodePath) var spawn_point_path
var spawn_point

var _stop_shield:bool=false
var _score_data:ScoreData

func _ready():
	spawn_point = get_node(spawn_point_path)
	_score_data= CoreGame.get_data("ScoreData")
	ScheduleBoard.connect("spawn_time",self,"spawn_enemy")
	ScheduleBoard.connect("shield_up",self,"stop_object_spawn")

func _put_enemy_in_floor(spawned):
	print("floor")
	var pos=spawn_point.get_floor_point()
	spawned.set_position(pos)

func _put_enemy_in_air(spawned):
	print("air")
	

func spawn_enemy():
	var enemy = _instance_enemy(Info.get_random_enemy())
	var level:int =enemy.get_high_level()
	var pos=spawn_point.get_position_level(level)
	enemy.set_position(pos)

func _instance_enemy(enemy) -> Node2D:
	var _enemy_to_spawn = enemy.instance()
	add_child(_enemy_to_spawn)
	_enemy_to_spawn.position = Vector2(0,0)
	return _enemy_to_spawn

func stop_object_spawn(stop:bool):
	_stop_shield=stop
