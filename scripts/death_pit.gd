extends Area2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	print('player died')
	timer.start(2.3)
	if Globals.alive:
		audio_stream_player.play(.6)
		var tween = create_tween()
		tween.tween_property(audio_stream_player, 'volume_db', -20, 2)
	Globals.max_jumps = 0
	Globals.alive = false
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
