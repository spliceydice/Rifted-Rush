extends HBoxContainer
func activate_fade_mode() -> void:
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0, 1.1)
