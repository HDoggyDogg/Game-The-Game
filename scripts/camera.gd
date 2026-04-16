extends Camera2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"


func _process(_delta):
	if Globals.alive == true:
		global_position = character_body_2d.global_position	


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
