extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	print("power")
	Globals.max_jumps += 1
	collision_shape_2d.set_deferred("disabled", true)
	sprite_2d.hide()
	audio_stream_player_2d.play(.3)
