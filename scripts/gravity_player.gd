extends CharacterBody2D
@onready var powered: Sprite2D = $Powered
@onready var jump: AudioStreamPlayer = $Jump
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var normal_sprite: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var boot: Area2D = $Area2D

var just_switched = false
var was_on_ground = false

const SPEED = 535.0
var JUMP_VELOCITY = -650.0

func _ready():
	var current_scene = get_tree().current_scene.scene_file_path
	powered.hide()
	if current_scene == "res://scenes/level2.tscn":
		Globals.has_dark = true
	else:
		Globals.has_dark = false
func bounce():
		velocity.y = JUMP_VELOCITY
		move_and_slide()
		
func _process(delta: float) -> void:
	if Globals.gravity_direction == -1:
		powered.flip_v = true
		normal_sprite.flip_v = true
	else:
		powered.flip_v = false
		normal_sprite.flip_v = false
func _physics_process(delta: float) -> void:
	velocity += get_gravity() * Globals.gravity_direction * delta

	var on_ground = is_on_floor() or is_on_ceiling()

	if on_ground and !was_on_ground:
		just_switched = false

	if Input.is_action_just_pressed("ui_accept") and just_switched == false:
		Globals.gravity_direction *= -1
		boot.position.y += Globals.boot_move
		Globals.boot_move = -Globals.boot_move
		JUMP_VELOCITY = -JUMP_VELOCITY
		just_switched = true

	was_on_ground = on_ground
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
