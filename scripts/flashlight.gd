extends Area2D
var dark_scale = Vector2(2, 2)
@onready var dark: Sprite2D = $"../../CharacterBody2D/Dark"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $"../Sprite2D"

func _on_body_entered(body: Node2D) -> void:
	dark.scale *= dark_scale
	dark.position.y += Globals.pos
	Globals.pos *= 2
	#Globals.x_offset /= 2
	Globals.y_offset /= 2  
	collision_shape_2d.set_deferred("disabled", true)
	sprite_2d.hide()
	print(dark.offset.y)
	
