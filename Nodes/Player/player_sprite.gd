extends Sprite2D
var time : float = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	position.y += cos(time) / 3
	
	flip_h = get_parent().flipped
