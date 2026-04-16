extends Area2D
@onready var image: Sprite2D = $".."


func _on_body_entered(body: Node2D) -> void:
	if not Secrets.Understandtion:
		Secrets.Understandtion = true
		Globals.secrets_found += 1
