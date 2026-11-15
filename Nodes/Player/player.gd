extends CharacterBody2D

const SPEED : float = 10.0
var echo_point = load("res://Nodes/EchoPoint/echo_point.tscn").instantiate()
var can_scream : bool = true

func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	
	position += Vector2(direction.x, direction.y)
	
	_calculate_direction(direction)
	
	if Input.is_action_just_pressed("scream") && can_scream:
		var instance = echo_point.duplicate()
		instance.position = position
		get_parent().add_child(instance)
		can_scream = false
		await get_tree().create_timer(1.5).timeout
		can_scream = true
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
