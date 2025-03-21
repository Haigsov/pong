extends Area2D

@export var is_player1: bool

func _ready() -> void:
	body_entered.connect(despawn_ball)
	
func despawn_ball(body:PhysicsBody2D) -> void:
	print("goal")
	body.queue_free()
