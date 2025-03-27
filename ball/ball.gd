extends CharacterBody2D

@onready var ball: CharacterBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var area_2d: Area2D = $Area2D
var horizontal_speed:int
var vertical_speed:int
var multiplier:float = 1.25

func _ready() -> void:
	randomize_velocity()
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	

func _physics_process(delta: float) -> void:
	move_ball(delta)
	

func move_ball(delta: float) -> void:
	move_and_collide(velocity * delta)

func _on_area_2d_body_entered(body: CollisionObject2D) -> void:
	print("touch")
	if body is StaticBody2D:
		print("y = %.2f" % velocity.y)
		velocity.y = velocity.y * -1
	elif body is CharacterBody2D:
		body.collision_shape_2d.disabled = true
		body.timer.start()
		velocity.x = velocity.x * -1 * multiplier
		print("x = %.2f" % velocity.x)

#randomize velocity
func randomize_velocity() -> void:
	if (randi() % 2) == 0:
		horizontal_speed = 100
	else:
		horizontal_speed = -100
	if (randi() % 2) == 0:
		vertical_speed = 100
	else:
		vertical_speed = -100 
	velocity = Vector2(horizontal_speed, vertical_speed)
