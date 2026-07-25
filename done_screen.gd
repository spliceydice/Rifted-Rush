extends Node2D
func _ready() -> void:
	Global.tutorial = false
	Global.lives = 5
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_screen.tscn")
func _on_quit_pressed() -> void:
	get_tree().quit()
