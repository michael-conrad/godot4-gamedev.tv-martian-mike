extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var sensor = $CollisionShape2D

func play_animation() -> void:
	animation.play("default")
	
