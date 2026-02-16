extends CharacterBody3D

@export var potato = preload("res://potato.tscn")
@export var throw_velocity = 15.0

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	print("hiworkosoekg,kdf,gk,dksg,kjsdnlkgnk")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func throw():
	print("potato")
	var obj = potato.instantiate()
	get_tree().root.add_child(obj)
	obj.global_position = global_position
	
	var direction = -transform.basis.z
	obj.linear_velocity = throw_velocity * direction
	
	
