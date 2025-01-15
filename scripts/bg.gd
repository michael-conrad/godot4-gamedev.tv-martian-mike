extends ParallaxBackground

@onready var sprite: Sprite2D = $ParallaxLayer/Sprite2D
@export var speed: int = 15
@export var texture: CompressedTexture2D = preload("res://assets/textures/bg/Pink.png")


func _ready() -> void:
	sprite.texture = texture

func _process(delta: float) -> void:
	sprite.region_rect.position += delta * Vector2(speed, speed)
	sprite.region_rect.position.x =  wrapf(sprite.region_rect.position.x, 0, sprite.texture.get_width())
	sprite.region_rect.position.y =  wrapf(sprite.region_rect.position.y, 0, sprite.texture.get_height())
