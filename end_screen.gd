extends Node2D
@onready var score_label: RichTextLabel = $Score
@onready var high_score_label: RichTextLabel = $"High Score"
func _ready() -> void:
	Global.tutorial = false
	Global.lives = 5
	Global.minigames_done = 0
	Global.last_minigame_picked = 0
	if Global.score > Global.high_score:
		Global.high_score = Global.score
	score_label.text = "" + str(Global.score)
	high_score_label.text = "High Score: " + str(Global.high_score)
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_screen.tscn")
	Global.score = 0
func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings_screen.tscn")
	Global.score = 0
