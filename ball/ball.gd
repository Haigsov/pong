extends CharacterBody2D

@onready var ball: CharacterBody2D = $"."
var speed:int = 450
var dir:Vector2 = Vector2(45.0, 90.0)
var multiplier:float = 1


func _physics_process(delta: float) -> void:
	velocity = Vector2(100, -100) * multiplier
	move_and_slide()
