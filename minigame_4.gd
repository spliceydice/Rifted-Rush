extends Node2D

@onready var minigame_timer: Node2D = $minigame_timer
var timer_end = false

func _ready() -> void:
	$RichTextLabel.activate_fade_mode()
	if Global.tutorial:
		$Player.scale *= 0.6
		await minigame_timer.Timer(6.4) # scale this
	else:
		$Player.scale *= 0.675
		var t = Global.difficulty_t()
		await minigame_timer.Timer(lerp(6.4, 10.0, t)) # SCALE!!!
	#after this is completed...
	timer_end = true

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if timer_end:
		if Global.tutorial:
			get_tree().change_scene_to_file("res://done_screen.tscn")
			return
		else:
			Global.score += int(Global.SURVIVE_COMPLETION_BONUS * (1.0 + Global.difficulty_t()))
			get_tree().change_scene_to_file("res://timer_screen.tscn")
			return

@warning_ignore("unused_parameter")
func _on_player_player_area_entered(area: Variant) -> void:
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
