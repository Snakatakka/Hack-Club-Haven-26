extends CharacterBody2D

const SPEED = 10.0

func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	_calculate_direction(direction)
	
	move_and_slide()

func _calculate_direction(vector : Vector2):
	if vector.x:
		position.x += vector.x * SPEED
	else:
		move_toward(vector.x, 0.0, 0.5)
	
	if vector.y:
		position.y += vector.y * SPEED
	else:
		move_toward(vector.y, 0.0, SPEED)
