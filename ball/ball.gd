extends CharacterBody2D

@onready var ball: CharacterBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var area_2d: Area2D = $Area2D
var horizontal_speed:int = 100
var vertical_speed:int
var dir:Vector2 = Vector2(45.0, 90.0)
var multiplier:float = 1.25

func _ready() -> void:
	if (randi() % 2) == 0:
		vertical_speed = 100
	else:
		vertical_speed = -100 
	velocity = Vector2(horizontal_speed, vertical_speed)
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	

func _physics_process(delta: float) -> void:
	move_ball()
	

func move_ball() -> void:
	#var collision:KinematicCollision2D = move_and_collide(velocity * delta)
	move_and_slide()

func _on_area_2d_body_entered(body: CollisionObject2D) -> void:
	if body is StaticBody2D:
		velocity.y = velocity.y * -1
	elif body is CharacterBody2D:
		velocity.x = velocity.x * -1 * multiplier
		print(velocity.x)
