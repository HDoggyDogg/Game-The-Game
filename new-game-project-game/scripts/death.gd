extends Area2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if Globals.max_jumps > 1:
		Globals.max_jumps = 1
	else:
		# Stop player movement
		body.set_physics_process(false)
		body.hide()
		# Freeze camera smoothing
		var cam = body.get_node("Camera2D")
		cam.position_smoothing_enabled = false
		Globals.alive = false
		print('player died')
		timer.start()
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
	
