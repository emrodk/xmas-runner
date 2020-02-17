extends Control
class_name HUD

onready var score_node=get_node("score")

signal jump_pressed

func _ready():
	$OnGameOver.hide()
	$OnStart.show()
	ScheduleBoard.connect("player_death",self,"show_gameover")

#Game singleton on_score_update callback
func _on_score_update(score):
	score_node.set_text(str(score))

#pause pressed callback
func _on_pause_pressed():
	get_tree().set_pause(!get_tree().is_paused())

func show_gameover():
	$OnGameOver/Score/Label.set_text("Best Score\n"+str(Info.get_best_score()))
	$OnGameOver.show()

func show_start():
	$OnStart/GeneralMessage.text="Tap to jump"
	$OnGameOver/PlayButtonLabel.text= "Ready ?"
	$OnStart.show()

func _start_to_run():
	$OnGameOver.hide()
	$OnStart.hide()
	ScheduleBoard.call("clear_level")
	ScheduleBoard.call("start_to_run")

func _on_Jump_button_down():
	emit_signal("jump_pressed")


func _on_Exit_pressed():
	get_tree().quit()
