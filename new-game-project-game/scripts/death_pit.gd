extends Area2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
		# Stop player movement
		body.set_physics_process(false)
		body.hide()
		# Freeze camera smoothing
		Globals.alive = false
		print('player died')
		timer.start(2)
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
