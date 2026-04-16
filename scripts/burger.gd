extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if not Secrets.Burger:
		Secrets.Burger = true
		Globals.secrets_found += 1
