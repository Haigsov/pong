extends CharacterBody2D

@onready var ball: CharacterBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
var speed:int = 450
var dir:Vector2 = Vector2(45.0, 90.0)
var multiplier:float = 1


#func _ready() -> void:
	#collision_shape_2d.

func _physics_process(_delta: float) -> void:
	velocity = Vector2(100, -100) * multiplier
	move_and_slide()
	
