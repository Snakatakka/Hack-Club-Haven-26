extends Area2D


var clear : Color = Color(0, 0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy") or body.is_in_group("Door"):
		var tween = get_tree().create_tween() 
		body.sprite.self_modulate = Color.WHITE
		tween.tween_property(body.sprite, "self_modulate", clear, 1.0)
