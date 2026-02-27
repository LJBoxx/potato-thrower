extends CharacterBody3D

@onready var bonesim = $RootNode/Armature/Skeleton3D/PhysicalBoneSimulator3D2

func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	bonesim.physical_bones_start_simulation()
	await get_tree().create_timer(5).timeout
	queue_free()
	
