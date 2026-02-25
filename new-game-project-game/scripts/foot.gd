extends Area2D
@onready var player: CharacterBody2D = $".."

func _on_body_entered(body):
	player.bounce()
	body.queue_free()
