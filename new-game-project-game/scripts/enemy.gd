extends Node2D


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	print('stomp')
	queue_free()
