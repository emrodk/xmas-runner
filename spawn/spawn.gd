extends Node2D

const Rock=preload("res://enemies/rock/rock.tscn")
const Bat=preload("res://enemies/bat/bat.tscn")
const Bonus=preload("res://bonus/bonus.tscn")
export (NodePath) var spawnPath
var _spawnPath:PathFollow2D
var _enemies:Array

export(NodePath) var player=null
var _player_node=null

func _ready():
	randomize()
	if(player!=null):
		_player_node=get_node(player)
	if(spawnPath!=null):
		_spawnPath=get_node(spawnPath)
	_enemies = [Bonus,Rock,Bat]
	_set_spawn_in_floor()

func _set_spawn_in_floor():
	_spawnPath.set_unit_offset(0.99)

func _instance_enemy(chance:int):
	var _enemy_to_spawn= _enemies[chance].instance()
	var pos=_spawnPath.global_position
	get_parent().get_parent().add_child(_enemy_to_spawn)
	_enemy_to_spawn.set_position(pos)

func _on_Timer_timeout():
	var rand_val=randf()
#	_spawnPath.set_unit_offset(rand_val)
	print(_spawnPath.get_unit_offset())
	print(_spawnPath.position.y)
	if(rand_val>0.4):
		if(rand_val<0.5):
			_instance_enemy(0) #bonus
		elif(rand_val<0.8):
			_set_spawn_in_floor()
			_instance_enemy(1) #rock
		else:
			_instance_enemy(2) #bat
