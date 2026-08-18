extends Area2D
# decrease rotation step for scaling later
@export var rotation_step: float = 30.0

func _unhandled_input(event) -> void:
	if event is InputEventKey and event.pressed and not event.is_echo():
		if rotation_degrees > -60:
			if event.keycode == KEY_LEFT:
				rotation_degrees -= rotation_step
		if rotation_degrees < 60:
			if event.keycode == KEY_RIGHT:
				rotation_degrees += rotation_step
