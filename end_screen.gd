extends Node2D
@onready var score_label: RichTextLabel = $Score
	score_label.text = "" + str(Global.score)
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_screen.tscn")
	Global.score = 0
func _on_quit_pressed() -> void:
	get_tree().quit()
func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings_screen.tscn")
	Global.score = 0
