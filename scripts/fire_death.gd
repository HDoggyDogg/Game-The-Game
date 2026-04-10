extends Area2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	body.set_physics_process(false)
	body.hide()
	Globals.alive = false
	print('player died')
	timer.start()
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
