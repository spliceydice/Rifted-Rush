extends Node2D

@export var fireball_scene: PackedScene = preload("res://fireball.tscn")

func _on_timer_timeout() -> void:
	if not fireball_scene:
		return
	var screen_size = get_viewport().get_visible_rect().size
	var edge: int
	var roll = randf()
	if roll < 0.5:
		edge = 0 # top - 50% of spawns
	elif roll < 0.75:
		edge = 1 # left - 25%
	else:
		edge = 2 # right - 25%
	var spawn_position = Vector2.ZERO
	var padding = 150.0
	
	match edge:
		0:
			spawn_position.x = randf_range(-padding, screen_size.x + padding)
			spawn_position.y = -padding
		1:
			spawn_position.x = -padding
			spawn_position.y = randf_range(-padding, screen_size.y)
		2: 
			spawn_position.x = screen_size.x + padding
			spawn_position.y = randf_range(-padding, screen_size.y)
			
	var target_position = Vector2(screen_size.x / 2.0, screen_size.y)
	
	var fireball_instance = fireball_scene.instantiate()
	fireball_instance.spawn_pos = spawn_position
	fireball_instance.target_pos = target_position
	
	get_parent().add_child(fireball_instance)
