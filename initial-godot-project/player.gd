extends CharacterBody2D

const SPEED = 300.0
var target_position: Vector2 = Vector2.ZERO
var has_target := false

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction:
		has_target = false
		velocity = direction * SPEED
	elif has_target and position.distance_to(target_position) > 5.0:
		velocity = position.direction_to(target_position) * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	position.x = clamp(position.x, 0.0, 760.0)
	position.y = clamp(position.y, 0.0, 410.0)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			target_position = event.position
			has_target = true
