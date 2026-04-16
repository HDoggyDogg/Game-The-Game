extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("teleporting")
	timer.start()
	
	
func _on_timer_timeout() -> void:
	Globals.reset()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
