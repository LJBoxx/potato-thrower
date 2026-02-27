extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Skeleton3D/PhysicalBoneSimulator3D2.physical_bones_start_simulation()
