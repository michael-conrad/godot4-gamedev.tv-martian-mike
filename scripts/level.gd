extends Node2D

@export var next_level: PackedScene = null
@export var level_time: int = 30
@export var final_level: bool = false

@onready var player = null
@onready var camera = $Player/Camera2D
@onready var spawn_point = $Start
@onready var exit_point = $Exit
@onready var death_zone = $"Death Zone"
@onready var hud = $UI/HUD
@onready var ui = $UI

var timer = Timer.new()
var time_remaining: float = 0

func _ready() -> void:
	ui.show_win_screen(false)
	
	player = get_tree().get_first_node_in_group("player")
	reset_player()
	
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:		
		if trap.has_signal("touched_player"):
			print(trap)
			trap.touched_player.connect(_on_trap_touched_player)
	
	if exit_point != null:
		exit_point.body_entered.connect(_on_exit_body_entered)	
	
	if death_zone != null:
		death_zone.body_entered.connect(_on_death_zone_body_entered)
		
	time_remaining = level_time
	timer.name = "Level Timer"
	timer.wait_time = 1  # Fixed tick rate
	timer.timeout.connect(_on_timeout)
	add_child(timer)
	timer.start()
	hud.set_time_label(time_remaining)

func _on_timeout() -> void:
	if not player.active:
		return
	time_remaining -= 1
	if time_remaining <= 0:
		reset_player()
		time_remaining = level_time
	hud.set_time_label(time_remaining)

func _on_exit_body_entered(body: Variant) -> void:
	if body is not Player:
		return
	exit_point.play_animation()
	disable_player()
	if next_level != null:
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_packed(next_level)
	if final_level:
		await get_tree().create_timer(5.0).timeout
		ui.show_win_screen(true)
	
func disable_player() -> void:
	player.active = false
	
func set_camera_limits(left: int, right: int, top: int, bottom: int):
	camera.left = left
	camera.right = right
	camera.top = top
	camera.bottom = bottom

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		


func _on_death_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		reset_player()


func _on_trap_touched_player() -> void:
	reset_player()


func reset_player():
	if player == null:
		return
	print("Reset Player")
	player.velocity = Vector2.ZERO
	player.global_position = spawn_point.get_spawn_pos()
	time_remaining = level_time
	
