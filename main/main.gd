extends Node2D

# References all packedscenes instantiated in main
@onready var p1_scoreboard: Label = %"P1 Scoreboard"
@onready var p2_scoreboard: Label = %"P2 Scoreboard"
@onready var goal: Area2D = %Goal
@onready var goal2: Area2D = %Goal2
@onready var ball: CharacterBody2D = $Ball
# Keeps track of player scores
var p1_score:int = 0
var p2_score:int = 0

func _ready() -> void:
	# Sets up player scoreboards
	p1_scoreboard.text = str(p1_score)
	p2_scoreboard.text = str(p2_score)
	# Connects area2d goals to methods
	goal.body_entered.connect(despawn_ball_goal1)
	goal2.body_entered.connect(despawn_ball_goal2)

func despawn_ball_goal1(body:PhysicsBody2D) -> void:
	# Increases scoreboard by + 1
	p2_score += 1
	p2_scoreboard.text = str(p2_score)
	# Resets ball back to spawn point
	reset_ball(body)


func despawn_ball_goal2(body:PhysicsBody2D) -> void:
	# Increases scoreboard by + 1
	p1_score += 1
	p1_scoreboard.text = str(p1_score)
	# Resets ball back to spawn point
	reset_ball(body)

# Puts ball back to original spawn point
func reset_ball(body:PhysicsBody2D) -> void:
	body.position = Vector2(574, 341)
	body.randomize_direction()
