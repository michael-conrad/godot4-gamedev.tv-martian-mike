extends Node

var hurt_sound = preload("res://assets/audio/hurt.wav")
var jump_sound = preload("res://assets/audio/jump.wav")

func play_sfx(name: String) -> void:
	
	var stream = null
	if name == "hurt":
		stream = hurt_sound
	elif name == "jump":
		stream = jump_sound
	else:
		print("Invalid SFX %s" % name)
		return
	
	var asp = AudioStreamPlayer.new()
	asp.name="SFX: %s" % name	
	asp.stream = stream
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()
