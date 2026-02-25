extends Area2D
@onready var enemy = get_parent()

func _on_body_entered(body: Node2D) -> void:
	enemy.queue_free()
