extends Node3D

@export var npc1: PackedScene
@export var npc2: PackedScene
@export var npc_amount: int = 10
@export var spawn_radius: float = 30.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(npc_amount):
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
