extends Node2D

@onready var minigame_timer: Node2D = $minigame_timer
var timer_end = false

func _ready() -> void:
	await minigame_timer.Timer(6.4) # scale this
	#after this is completed...
	timer_end = true

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if timer_end:
		get_tree().change_scene_to_file("res://timer_screen.tscn")
		return

@warning_ignore("unused_parameter")
func _on_player_player_area_entered(area: Variant) -> void:
	Global.lives -= 1
	Global.minigames_done -=1
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://death_screen.tscn")
		return
	else:
		get_tree().call_deferred("change_scene_to_file", "res://timer_screen.tscn" )
		return
