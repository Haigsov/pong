extends Node2D

@onready var p1_scoreboard: Label = %"P1 Scoreboard"
@onready var p2_scoreboard: Label = %"P2 Scoreboard"
@onready var goal: Area2D = %Goal
@onready var goal2: Area2D = %Goal2
@onready var ball: CharacterBody2D = $Ball
var p1_score:int = 0
var p2_score:int = 0

func _ready() -> void:
	p1_scoreboard.text = str(p1_score)
	p2_scoreboard.text = str(p2_score)
	goal.body_entered.connect(despawn_ball_goal1)
	goal2.body_entered.connect(despawn_ball_goal2)

func despawn_ball_goal1(body:PhysicsBody2D) -> void:
	p2_score += 1
	p2_scoreboard.text = str(p2_score)
	reset_ball(body)


func despawn_ball_goal2(body:PhysicsBody2D) -> void:
	p1_score += 1
	p1_scoreboard.text = str(p1_score)
	reset_ball(body)

func reset_ball(body:PhysicsBody2D) -> void:
	body.position = Vector2(574, 341)
	body.randomize_velocity()
