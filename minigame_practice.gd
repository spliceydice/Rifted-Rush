extends Node2D

func _on_minigame_1_pressed() -> void:
	Global.lives = 99999
	Global.tutorial = false
	Global.forced_minigame = 1
	get_tree().change_scene_to_file("res://timer_screen.tscn")

func _on_minigame_2_pressed() -> void:
	Global.lives = 99999
	Global.tutorial = false
	Global.forced_minigame = 2
	get_tree().change_scene_to_file("res://timer_screen.tscn")

func _on_minigame_3_pressed() -> void:
	Global.lives = 99999
	Global.tutorial = false
	Global.forced_minigame = 3
	get_tree().change_scene_to_file("res://timer_screen.tscn")

func _on_minigame_4_pressed() -> void:
	Global.lives = 99999
	Global.tutorial = false
	Global.forced_minigame = 4
	get_tree().change_scene_to_file("res://timer_screen.tscn")

func _on_minigame_5_pressed() -> void:
	Global.lives = 99999
	Global.tutorial = false
	Global.forced_minigame = 5
	get_tree().change_scene_to_file("res://timer_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
