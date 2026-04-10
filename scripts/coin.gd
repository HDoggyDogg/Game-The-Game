extends Node2D
@onready var sound: AudioStreamPlayer2D = $Area2D/AudioStreamPlayer2D
var children = get_children()
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print('coin')
	Globals.coins += 1
	sound.play(.1)
	collision_shape_2d.set_deferred("disabled", true)
	sprite_2d.hide()
