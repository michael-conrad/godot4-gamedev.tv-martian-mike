extends Node2D

signal touched_player

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.speed_scale += randf_range(-0.01, 0.01)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		touched_player.emit()
