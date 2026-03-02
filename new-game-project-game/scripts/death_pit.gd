extends Area2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	# Stop player movement
	body.set_physics_process(false)
	body.hide()
	Globals.alive = false
	print('player died')
	timer.start(3)
	audio_stream_player_2d.play(.3)
		
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
