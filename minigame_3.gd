extends Node2D

@onready var minigame_timer: Node2D = $minigame_timer
var timer_end = false

func _ready() -> void:
	$RichTextLabel.activate_fade_mode()
	$controls.activate_fade_mode()
	await minigame_timer.Timer(6.5) # scale this
	#after this is completed...
	timer_end = true 

func _process(delta: float) -> void:
	if timer_end:
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
