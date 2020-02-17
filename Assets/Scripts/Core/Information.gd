extends Node

func get_random_enemy_index() -> int:
	return CoreGame.get_data("Enemies").get_random_index()

func get_enemy_name(index:int):
	return CoreGame.get_data("Enemies").get_enemy_name(index)

func get_random_enemy():
	return CoreGame.get_data("Enemies").get_random_enemy()

func is_game_started() -> bool:
	return CoreGame.get_data("MoveData").is_moving

func get_stage_velocity() -> float:
	return CoreGame.get_data("MoveData").speed

func get_shield_color()->Color:
	return CoreGame.get_data("PlayerData").shield_color

func get_best_score() -> int:
	return CoreGame.get_data("ScoreData").get_best_score()
