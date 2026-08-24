extends Node2D
@onready var minigame_timer: Node2D = $minigame_timer

var buttons_pressed = 0
var timer_end = false

func _ready() -> void:
	$RichTextLabel.activate_fade_mode()
	if Global.tutorial:
		await minigame_timer.Timer(3)
	else:
		var t = Global.difficulty_t()
		await minigame_timer.Timer(lerp(3.0, 1.6, t)) # SCALE!!!
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 4:
		Global.add_time_score(minigame_timer.time)
		Global.score += Global.BASE_POINTS
		get_tree().change_scene_to_file("res://timer_screen.tscn")
		return
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		if Global.lives == 0:
			if Global.tutorial:
				get_tree().change_scene_to_file("res://death_screen.tscn")
				return
			else:
				get_tree().change_scene_to_file("res://end_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://timer_screen.tscn")
			return
	
