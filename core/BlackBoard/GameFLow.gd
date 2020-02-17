class_name MoveData
extends Node

export var speed_increment:float
export var max_speed:float
var initial_speed:int
export var speed:int
var is_moving:bool


# Called when the node enters the scene tree for the first time.
func _ready():
	initial_speed=speed
	ScheduleBoard.connect("spawn_time",self,"add_speed")
	ScheduleBoard.connect("player_death",self,"stop_moving")
	ScheduleBoard.connect("start_to_run",self,"start_moving")

func reset_speed():
	speed=initial_speed

func add_speed(amount:float=speed_increment):
	if speed<speed_increment:
		speed += amount

func initialize():
	is_moving = false

func start_moving():
	is_moving=true

func stop_moving():
	is_moving=false
	reset_speed()
