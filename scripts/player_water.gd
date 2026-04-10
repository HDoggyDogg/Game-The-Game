extends CharacterBody2D
@onready var powered: Sprite2D = $Powered
@onready var jump: AudioStreamPlayer = $Jump
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var normal_sprite: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

var was_on_floor = false
var jumped_this_frame = false

var normal = Vector2(.7, .7)
var crouch = Vector2(.7, .4)
var sprite_normal_y = 0
var sprite_crouch_y = 40
var collision_normal = Vector2(36.5, 96.5)
var collision_crouch = Vector2(36.5, 56.5)

var camera_crouch = -100

const SPEED = 700.0
const CROUCH_SPEED = 200
const JUMP_VELOCITY = -350.0
var jump_count := 0
var gravity_modifier = .5
	
	
func _ready():
	var current_scene = get_tree().current_scene.scene_file_path
	powered.hide()
	sprite_normal_y = normal_sprite.position.y
	if current_scene == "res://scenes/level2.tscn":
		Globals.has_dark = true
	else:
		Globals.has_dark = false
	print(Globals.has_dark)
	get_gravity()
func bounce():
	if Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	else:
		velocity.y = JUMP_VELOCITY/2 
		move_and_slide()
func _process(delta: float) -> void:
	if Input.is_action_pressed('crouch') and Globals.alive == true:
		normal_sprite.scale = crouch
		powered.scale = crouch
		normal_sprite.position.y = sprite_normal_y + sprite_crouch_y
		powered.position.y = sprite_normal_y + sprite_crouch_y
		collision_shape_2d.shape.extents = collision_crouch
		collision_shape_2d.position.y = sprite_normal_y + sprite_crouch_y
	else:
		normal_sprite.scale = normal
		powered.scale = normal
		normal_sprite.position.y = sprite_normal_y
		powered.position.y = sprite_normal_y
		collision_shape_2d.shape.extents = collision_normal
		collision_shape_2d.position.y = sprite_normal_y
	if Globals.max_jumps > 1:
		powered.show()
		normal_sprite.hide()
	else:
		powered.hide()
		normal_sprite.show()
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * gravity_modifier * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			jump.play(.6)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
		
	if direction and not Input.is_action_pressed("crouch"):
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction and Input.is_action_pressed("crouch"):
		velocity.x = direction * CROUCH_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, CROUCH_SPEED)
	
	move_and_slide()
