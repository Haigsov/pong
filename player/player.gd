extends CharacterBody2D

@export var is_player1:bool = true
@export var is_ai:bool = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
var dir:float
var speed:int = 200
var movement_keys:Dictionary[String, Variant]

const p1_controls:Dictionary[String, Variant] = {
	"up" : "player 2 up", 
	"down" : "player 2 down"
}

const p2_controls:Dictionary[String, Variant] = {
	"up": "ui_up",
	"down": "ui_down",
}

func _ready() -> void:
	if is_player1:
		movement_keys = p1_controls
	else:
		movement_keys = p2_controls

func _physics_process(_delta: float) -> void:
	player_move()

func player_move() -> void:
	dir = Input.get_axis(movement_keys["up"], movement_keys["down"])
	velocity.y = dir * speed
	move_and_slide()
