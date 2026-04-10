extends Area2D
@onready var image: Sprite2D = $"../SneakersOtoole_jpeg"



func _ready() -> void:
	image.hide()

func _on_body_entered(body: Node2D) -> void:
	image.show()
	if not Secrets.Sneakers:
		Secrets.Sneakers = true
		Globals.secrets_found += 1
		
