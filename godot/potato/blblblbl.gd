extends CharacterBody3D

@onready var bonesim = $RootNode/Armature/Skeleton3D/PhysicalBoneSimulator3D2
@onready var SPEED = 3.0
@onready var health = 100.0

var ded = false
var walk_direction = 1.0

func _ready() -> void:
	Events.pause.connect(_on_pause)
	velocity.z = randf_range(-5.0, 5.0)
	await get_tree().create_timer(67).timeout
	death()

func _on_pause():
	if !Events.is_paused:
		set_physics_process(false)
	else:
		set_physics_process(true)

func _on_area_3d_body_entered(body: Node3D) -> void:
	health -= body.linear_velocity.length()
	if health <= 0:
		if !ded:
			Events.death.emit()
		death()
	
func _physics_process(delta: float) -> void:
	if ded:
		velocity.x = 0
		velocity.z = 0
	else:
		velocity.x = SPEED * walk_direction
		velocity.z = move_toward(velocity.z, 0, delta*2.0)
	move_and_slide()

func death():
	bonesim.physical_bones_start_simulation()
	ded = true
	await get_tree().create_timer(2.6).timeout
	queue_free()
