extends CharacterBody2D

# References necessary nodes
@onready var ball: CharacterBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
# Initializes variables
var horizontal_speed:int
var vertical_speed:int
# Multiplies ball's velocity each time a paddle collides with it
var multiplier:float = 1.25

func _ready() -> void:
	# Randomizes direction of ball when game starts
	randomize_direction()
	# Connects method with area2d
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	# Connects method with timer
	timer.timeout.connect(change_collision)
	# Changes timer properties
	timer.wait_time = 0.5
	timer.one_shot = true

# Runs every frame
func _physics_process(delta: float) -> void:
	move_ball(delta)

# Uses move_and_collide to make ball collide only once
func move_ball(delta: float) -> void:
	move_and_collide(velocity * delta)

# Decides ball behavior based on CollisionObject2D
func _on_area_2d_body_entered(body: CollisionObject2D) -> void:
	# If it collides with the wall make it bounce off of it
	if body is StaticBody2D:
		print("y = %.2f" % velocity.y)
		velocity.y = velocity.y * -1
	# If it collides with paddle bounce off it add velocity mulitplier
	elif body is CharacterBody2D:
		# Change collision of ball temporarily to not cause collision errors
		set_collision_layer_value(2, false)
		set_collision_mask_value(1, false)
		velocity.x = velocity.x * -1 * multiplier
		print("x = %.2f" % velocity.x)
		timer.start()

#randomize direction of ball when game starts
func randomize_direction() -> void:
	if (randi() % 2) == 0:
		horizontal_speed = 100
	else:
		horizontal_speed = -100
	if (randi() % 2) == 0:
		vertical_speed = 100
	else:
		vertical_speed = -100 
	velocity = Vector2(horizontal_speed, vertical_speed)

# Revert collision layer and mask changes when timer runs out
func change_collision() -> void:
	set_collision_layer_value(2,true)
	set_collision_mask_value(1, true)
