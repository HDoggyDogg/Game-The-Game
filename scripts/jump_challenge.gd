extends Area2D
var previous_jumps = 0

func _on_body_entered(body: Node2D) -> void:
	previous_jumps = Globals.max_jumps
	Globals.max_jumps = 0
