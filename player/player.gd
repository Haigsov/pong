extends CharacterBody2D

@export var is_player1:bool = true
@export var is_ai:bool = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
var dir:float
var speed:int = 200
var movement_keys:Dictionary[String, Variant]
var ball:PhysicsBody2D

# Player 1 controls
const p1_controls:Dictionary[String, Variant] = {
	"up" : "player 2 up", 
	"down" : "player 2 down"
}

# Player 2 controls
const p2_controls:Dictionary[String, Variant] = {
	"up": "ui_up",
	"down": "ui_down",
}

# Runs when Scene gets instantiated
func _ready() -> void:
	# Gets reference for the ball in scene
	ball = get_parent().get_node("Ball")
	# Checks if player 1 or 2
	if is_player1:
		movement_keys = p1_controls
	else:
		movement_keys = p2_controls

func _physics_process(_delta: float) -> void:
	# Checks if AI or not
	if not is_ai:
		player_move()
	else:
		ai_chase_ball()

func player_move() -> void:
	# Gets up and down controls
	dir = Input.get_axis(movement_keys["up"], movement_keys["down"])
	velocity.y = dir * speed
	move_and_slide()
	
func ai_chase_ball() -> void:
	# Lerp makes the paddle have a delay when chasing the ball
	var t:float = 0.05
	position.y = position.lerp(ball.position, t).y
	move_and_slide()
