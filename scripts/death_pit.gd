extends Area2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	Globals.alive = false
	print('player died')
	timer.start(2.3)
	audio_stream_player_2d.play(.6)
	var tween = create_tween()
	tween.tween_property(audio_stream_player_2d, 'volume_db', -20, 2)
	Globals.max_jumps = 0
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().reload_current_scene()
