extends Control

func _ready() -> void:
	set_time_label(1999)

func set_time_label(value: float) -> void:
	$TimeLabel.text = "TIME: %04d" % value
