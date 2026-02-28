extends Node3D

@export var npc1: PackedScene
@export var npc2: PackedScene
@export var npc_amount: int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(npc_amount):
		await get_tree().create_timer(randf_range(1.0, 5.0)).timeout
		spawn_random_npc()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_random_npc():
	var npc: PackedScene
	if randf() > 0.5:
		npc = npc1
	else:
		npc = npc2
	var npc_spawn = npc.instantiate()
	add_child(npc_spawn)
	npc_spawn.walk_direction = -1
	npc_spawn.tree_exited.connect(_on_object_destroyed)

func _on_object_destroyed():
	await get_tree().create_timer(randf_range(0, 5.0)).timeout
	spawn_random_npc()
