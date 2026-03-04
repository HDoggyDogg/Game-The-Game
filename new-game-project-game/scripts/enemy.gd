extends Node2D
@onready var collision_shape_2d: CollisionShape2D = $KillZone/CollisionShape2D
@onready var collision_shape_2d2: CollisionShape2D = $Area2D2/CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Area2D2/AudioStreamPlayer2D


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	collision_shape_2d.set_deferred('disabled', true)
	collision_shape_2d2.set_deferred('disabled', true)
	sprite_2d.hide()
	audio_stream_player_2d.play(.6)
