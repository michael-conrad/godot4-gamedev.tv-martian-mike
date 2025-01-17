extends Control

@onready var retry_button = $Button

func _process(_delta: float) -> void:
	if visible and Input.is_action_just_pressed("xbox_a"):
		get_tree().change_scene_to_file( "res://scenes/start_menu.tscn")
