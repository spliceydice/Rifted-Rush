extends Area2D
# decrease rotation step for scaling later
@export var rotation_step: float = 30.0

func _ready() -> void:
	if rotation_step > 20:
		if not Global.tutorial:
			var t = Global.difficulty_t()
			rotation_step = rotation_step - lerp(0.0, 8.0, t) # SCALE!!!

func _unhandled_input(event) -> void:
	if event is InputEventKey and event.pressed and not event.is_echo():
		if rotation_degrees > -60:
			if event.keycode == KEY_LEFT:
				rotation_degrees -= rotation_step
		if rotation_degrees < 60:
			if event.keycode == KEY_RIGHT:
				rotation_degrees += rotation_step
