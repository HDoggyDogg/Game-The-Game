extends Area2D
@onready var timer: Timer = $Timer
@onready var hurt: AudioStreamPlayer2D = $"../Area2D2/AudioStreamPlayer2D"
@onready var death: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if Globals.max_jumps > 1:
		Globals.max_jumps = 1
		hurt.play(.6)
	else:
		# Stop player movement
		body.set_physics_process(false)
		body.hide()
		# Freeze camera smoothing
		Globals.alive = false
		print('player died')
		timer.start()
		death.play(.3)
		
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
	
