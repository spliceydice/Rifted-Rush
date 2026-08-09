extends Node2D
func _ready() -> void:
	Global.tutorial = false
	Global.lives = 5
	Global.minigames_done = 0
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_screen.tscn")
func _on_quit_pressed() -> void:
	get_tree().quit()
func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings_screen.tscn") # Replace with function body.
