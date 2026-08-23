extends Node2D

@onready var minigame_timer: Node2D = $minigame_timer
var timer_end = false

func _ready() -> void:
	$RichTextLabel.activate_fade_mode()
	$controls.activate_fade_mode()
	if Global.tutorial:
		await minigame_timer.Timer(6.5) # scale this
	else:
		var t = Global.difficulty_t()
		await minigame_timer.Timer(lerp(6.5, 11.0, t)) # SCALE!!!
	#after this is completed...
	timer_end = true 

func _process(delta: float) -> void:
	if timer_end:
		Global.score += int(Global.SURVIVE_COMPLETION_BONUS * (1.0 + Global.difficulty_t()))
		get_tree().change_scene_to_file("res://timer_screen.tscn")
		return

func _on_moon_area_entered(area: Area2D) -> void:
	Global.lives -= 1
	Global.minigames_done -=1
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://death_screen.tscn")
		return
	else:
		get_tree().change_scene_to_file("res://timer_screen.tscn")
		return
