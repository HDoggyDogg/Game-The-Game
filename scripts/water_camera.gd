extends Camera2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"


func _process(_delta):
	if Globals.alive == true:
		global_position.x = character_body_2d.global_position.x
