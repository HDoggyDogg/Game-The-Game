extends Area2D
@onready var image: Sprite2D = $".."

func _ready() -> void:
	image.hide()

func _on_body_entered(body: Node2D) -> void:
	image.show()
	if not Secrets.Krabs:
		Secrets.Krabs = true
		Globals.secrets_found += 1
