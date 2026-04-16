extends Area2D
@onready var timer: Timer = $Timer
@onready var hurt: AudioStreamPlayer2D = $"../Area2D2/AudioStreamPlayer2D"
@onready var death: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var powered: Sprite2D = $Powered
@onready var dark: Sprite2D = $"../../CharacterBody2D/Dark"
@onready var character_body_2d: CharacterBody2D = $"../../CharacterBody2D"

func _on_body_entered(body: Node2D) -> void:
	if Globals.max_jumps > 1:
		Globals.max_jumps = 1
		hurt.play(.6)
	else:
		if Globals.has_dark:
			character_body_2d.remove_child(dark)
			var parent = character_body_2d.get_parent()
			parent.add_child(dark)
			dark.global_position = character_body_2d.global_position
			dark.offset.y -= Globals.y_offset
			#dark.offset.x += Globals.x_offset
		body.set_physics_process(false)
		body.hide()
		Globals.alive = false
		print('player died')
		timer.start()
		death.play(.3)
		
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
	
