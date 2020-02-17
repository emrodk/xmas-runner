class_name Player
extends KinematicBody2D

onready var animator=$AnimationPlayer

var velocity = Vector2()
var jumping = false
var _is_running=false
var _is_death=false
var spring:bool
var spring_jump_speed=-3900
var is_falling:bool
var _initial_position:Vector2

var hit_bat:bool
var hit_bat_jump_speed=-2300
var _material_sprite:Material
var prev_high:float

var _shield:bool

var _data:PlayerData

func _ready():
	animator.play("Idle")
	_initial_position=position
	_material_sprite = $Node2D/santa_claus.get_material()
	_data = CoreGame.get_data("PlayerData")
	ScheduleBoard.connect("start_to_run",self,"start_run")

func start_run():
	is_falling=false
	$collision.set_disabled(false)
	_is_running=true
	_is_death=false
	shield_down()
	animator.play("run")
	set_physics_process(true)

func get_input():
	var jump = Input.is_action_just_pressed('jump')
	if jump and is_on_floor():
		jumping = true
		velocity.y = _data.jump_speed
		animator.play("jump")
	if spring:
		jumping = true
		spring=false
		velocity.y = spring_jump_speed
		animator.play("jump")
	if hit_bat:
		jumping = true
		hit_bat=false
		velocity.y = hit_bat_jump_speed
		animator.play("jump")

func _physics_process(delta):
	if _is_running:
		get_input()
		velocity.x=0
		velocity.y += _data.gravity * delta
		if(velocity.y>600):
			animator.play("run")
		if jumping and is_on_floor():
			jumping = false
		velocity = move_and_slide(velocity, Vector2(0, -1),true)
	elif _is_death:
		velocity.y += _data.gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1),true)
	elif is_on_floor():
		set_physics_process(false)
	position.x=_initial_position.x
	if animator.current_animation == "jump" && $Node2D/santa_claus.frame>=6 && prev_high<position.y:
		animator.play("fall")
#		pass

func kill():
	if _shield and not is_falling:
		shield_down()
	else:
		_is_running=false
		_is_death=true
		spring=false
		hit_bat=false
		jumping=false
		if(is_falling):
			animator.play("fall")
		else:
			animator.play("dead")
		ScheduleBoard.emit_signal("player_death")

func jump():
	if(!_is_death):
		Input.action_press("jump",1)

func spring_jump():
	if(!_is_death):
		spring=true

func bat_jump():
	if(!_is_death):
		hit_bat=true

func fall():
	is_falling=true
	
func shield_up(duration:int):
	_set_aura(2)#Level two aura
	_shield=true
	ScheduleBoard.call("shield_up",true)
	$OneTime.start(duration,"shield")

func _set_aura(level:int):
	_material_sprite.set_shader_param("aura_color",Info.get_shield_color())
	_material_sprite.set_shader_param("aura_width",level)
	
func shield_down():
	if _shield:
		_set_aura(0)
		_shield=false
		ScheduleBoard.call("shield_up",false)

func _on_OneTime_timeout(name):
	match name:
		"shield":
			shield_down()
