extends Node2D
@onready var themed_timer: Node2D = $minigame_timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(4)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:

		
	if buttons_pressed == 4:
		if Global.tutorial:
			get_tree().change_scene_to_file("res://done_screen.tscn")
			return
		else:
			get_tree().change_scene_to_file("res://timer_screen.tscn")
			return
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://death_screen.tscn")
			return
		else:
			get_tree().change_scene_to_file("res://timer_screen.tscn")
			return
	
