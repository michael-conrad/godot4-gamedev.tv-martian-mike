extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_power = 200
@onready var player_sprite = $AnimatedSprite2D

var active: bool = true

func _physics_process(delta: float) -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("jump") and active:
			jump(jump_power)			
	else:
		velocity.y += gravity * delta
		if velocity.y < 0:
			player_sprite.play("jump")
		else:
			player_sprite.play("fall")

	if active:
		var direction = Input.get_axis("left", "right")
		velocity.x = direction * speed
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()
	update_animations()

func jump(force: int):
	print("Jump %d" % force)
	velocity.y = -force

func update_animations():
	if velocity.x < 0:
		player_sprite.flip_h = true
	if velocity.x > 0:
		player_sprite.flip_h = false

	if is_on_floor():
		if velocity.x:
			player_sprite.animation = "run"
		else:
			player_sprite.animation = "idle"
