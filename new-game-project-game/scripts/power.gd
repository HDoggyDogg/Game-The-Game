extends Area2D
@onready var power: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	print("power")
	power.queue_free()
	Globals.max_jumps += 1
