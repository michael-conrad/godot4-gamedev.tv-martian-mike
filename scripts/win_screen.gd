extends Control

@onready var retry_button = $Button

func _process(_delta: float) -> void:
	if visible and Input.is_action_pressed("jump"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
