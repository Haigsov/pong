extends CharacterBody2D

@onready var ball: CharacterBody2D = $"."

func chase_ball() -> void:
	ball.global_position
