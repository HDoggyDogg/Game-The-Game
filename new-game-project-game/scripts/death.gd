extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Stop player movement
	body.set_physics_process(false)
	body.hide()
	# Freeze camera smoothing
	var cam = body.get_node("Camera2D")
	cam.position_smoothing_enabled = false
	
	Globals.alive = false
	print('player died')
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2
	timer.one_shot = false
	timer.start()
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_currnet_scene()
	
