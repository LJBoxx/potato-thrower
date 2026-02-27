extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angular_velocity = Vector3(
		randf_range(-10, 10),
		randf_range(-10, 10),
		randf_range(-10, 10)
	)
	await get_tree().create_timer(500).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
