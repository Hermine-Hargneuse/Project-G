extends Position2D

signal spawned(spawn)
export(PackedScene) var spawning_scene

func spawn():
	var spawning = spawning_scene.instance()
	add_child(spawning)
	return spawning
