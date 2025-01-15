extends Area2D

@export var power = 300

@onready var animation = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.jump(power)
		animation.play("jump")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "jump":
		animation.play("idle")
