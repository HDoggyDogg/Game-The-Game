extends Area2D
@onready var timer: Timer = $Timer

var can_enter = false

func _process(delta):
	if can_enter and Input.is_action_just_pressed("E") and not Globals.teleporting:
		print("teleporting")
		timer.start()
		Globals.teleporting = true

func _on_body_entered(body: Node2D) -> void:
	if Globals.level2:
		can_enter = true
		Globals.can_enter = true
		print('can enter')
	else: 
		Globals.not_enough_beaten = true

func _on_body_exited(body: Node2D) -> void:
	can_enter = false
	Globals.can_enter = false
	Globals.not_enough_beaten = false
	print("can not enter")

func _on_timer_timeout() -> void:
	Globals.reset()
	Globals.teleporting = false
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
