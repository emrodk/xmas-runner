extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _score_data:ScoreData

# Called when the node enters the scene tree for the first time.
func _ready():
	ScheduleBoard.connect("score_updated", self, "_on_score_update")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_score_update(new_value):
	set_text(str(new_value))
