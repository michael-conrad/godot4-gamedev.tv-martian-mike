extends StaticBody2D

@onready var spawn: Marker2D = $SpawnPosition

func get_spawn_pos() -> Vector2:
	return spawn.global_position
	
