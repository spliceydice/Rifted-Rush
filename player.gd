extends CharacterBody2D

@export var speed: float = 450.0

@export var texture_up: Texture2D
@export var texture_down: Texture2D
@export var texture_left: Texture2D
@export var texture_right: Texture2D

@onready var sprite = $Sprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	
	if direction != Vector2.ZERO:
		if abs(direction.x) >= abs(direction.y):
			if direction.x > 0 and texture_right:
				sprite.texture = texture_right
			elif direction.x < 0 and texture_left:
				sprite.texture = texture_left
		else:
			if direction.y > 0 and texture_down:
				sprite.texture = texture_down
			elif direction.y < 0 and texture_up:
				sprite.texture = texture_up
