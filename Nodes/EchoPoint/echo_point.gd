extends Node2D

const MAX_ECHO_RADIUS : float = 180
const GROW_SPEED : float = 2.5
@onready var collision_shape : CollisionShape2D = $Area2D/CollisionShape2D

func _ready() -> void:
	collision_shape.shape.radius = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collision_shape.shape.radius < MAX_ECHO_RADIUS:
		collision_shape.shape.radius += GROW_SPEED
	else:
		call_deferred("queue_free")
