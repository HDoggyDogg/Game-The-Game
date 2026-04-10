extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var player: CharacterBody2D = $"../../CharacterBody2D"

func _on_body_entered(body: Node2D) -> void:
	Globals.gravity_direction *= -1
	collision_shape_2d.set_deferred("disabled", true)
	sprite_2d.hide()
	audio_stream_player_2d.play(.3)
	player.boot.position.y += Globals.boot_move
	Globals.boot_move = -Globals.boot_move
	player.JUMP_VELOCITY = -player.JUMP_VELOCITY
