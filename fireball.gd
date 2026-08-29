extends Area2D

@export var explosion_scene: PackedScene
@export var min_speed: float = 275.0
@export var max_speed: float = 450.0

var spawn_pos: Vector2
var target_pos: Vector2
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	if not Global.tutorial:
		var t = Global.difficulty_t()
		min_speed = min_speed * lerp(1.0, 1.5, t) # SCALE!!!
		max_speed = max_speed * lerp(1.0, 1.5, t) # SCALE!!!
	
	position = spawn_pos
	
	var direction = (target_pos - position).normalized()
	var speed = randf_range(min_speed, max_speed)
	velocity = direction * speed
	look_at(target_pos)

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shield"):
		spawn_explosion()
		queue_free() 

func spawn_explosion() -> void:
	if explosion_scene:
		var explosion_instance = explosion_scene.instantiate()
		explosion_instance.global_position = $TipMarker.global_position
		explosion_instance.global_rotation = global_rotation
		get_tree().current_scene.add_child(explosion_instance)
