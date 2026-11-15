extends CharacterBody2D

enum State {
	SCREAMING,
	QUIET
}
const SPEED = 10.0
var current_state = State.QUIET
var correct_state = State.QUIET
signal state_changed(state : int)

func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	_calculate_direction(direction)
	_handle_state()
	
	move_and_slide()

func _handle_state():
	if Input.is_action_pressed("ui_accept"):
		correct_state = State.SCREAMING
	else:
		correct_state = State.QUIET
	
	if current_state != correct_state:
		_change_state(correct_state)

func _calculate_direction(vector : Vector2):
	if vector.x:
		position.x += vector.x * SPEED
	else:
		move_toward(vector.x, 0.0, 0.5)
	
	if vector.y:
		position.y += vector.y * SPEED
	else:
		move_toward(vector.y, 0.0, SPEED)

func _change_state(state : int) -> void:
	current_state = state
	state_changed.emit(current_state)
