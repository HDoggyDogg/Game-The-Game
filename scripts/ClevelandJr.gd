extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if not Secrets.ClevelandJr:
		Secrets.ClevelandJr = true
		Globals.secrets_found += 1
