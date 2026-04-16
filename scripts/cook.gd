extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if not Secrets.Cook:
		Secrets.Cook = true
		Globals.secrets_found += 1
