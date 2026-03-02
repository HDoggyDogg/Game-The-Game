extends CharacterBody2D
@onready var powered: Sprite2D = $Powered


const SPEED = 500.0
const JUMP_VELOCITY = -650.0
var jump_count := 0

func _ready():
	powered.hide()
func bounce():
	if Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	else:
		velocity.y = JUMP_VELOCITY/2 
	move_and_slide()
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < Globals.max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Globals.max_jumps > 1:
		powered.show()
	else:
		powered.hide()

	move_and_slide()
