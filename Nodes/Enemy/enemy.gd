extends CharacterBody2D

var speed : float = 5.0
@export var target_position : Vector2 = Vector2(100, 0)
var distance_walked : float = 0.0
var walk_distance : float
@onready var sprite = $Sprite2D

func _ready() -> void:
	walk_distance = abs(target_position.x - position.x)

func _process(delta: float) -> void:
	if distance_walked >= walk_distance:
		distance_walked = 0
		speed = speed * -1
	else:
		position.x += speed
		distance_walked += abs(speed)
