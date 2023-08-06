extends StaticBody2D

@onready var sprite: Sprite2D = get_node("Sprite2D")

@export var speed: float
var direction: Vector2 = Vector2()

func _physics_process(delta):
	direction.x = Input.get_axis("left", "right")
	translate(direction * speed)
	rotation = lerp_angle(rotation, 120 * sign(direction.x), delta*10)


func _on_area_2d_body_entered(body):
	if body is MiniGameFood:
		body.gravity_scale = 0
		body.apply_central_impulse(Vector2(0, -1)*1500)
