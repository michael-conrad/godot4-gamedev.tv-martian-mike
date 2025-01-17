extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BG.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("xbox_a"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		return
	if Input.is_action_just_pressed("xbox_y"):
		get_tree().quit()
