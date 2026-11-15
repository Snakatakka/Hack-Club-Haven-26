extends Area2D

enum State {
	SCREAMING,
	QUIET
}
const MAX_YELL_RADIUS : float = 270.0
const MIN_YELL_RADIUS : float = 90.0
const GROW_SPEED : float = 0.5
@onready var collision_shape : CollisionShape2D = $CollisionShape2D
var yelling : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_yell_radius()

func _handle_yell_radius():
	if yelling:
		if collision_shape.shape.radius < MAX_YELL_RADIUS:
			collision_shape.shape.radius += GROW_SPEED
	else:
		collision_shape.shape.radius = MIN_YELL_RADIUS

func _get_state(state : int) -> void:
	yelling = (state == State.SCREAMING)
	print(yelling)
