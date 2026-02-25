extends Node2D

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.has_method('bounce'):
		body.bounce()
	queue_free()
