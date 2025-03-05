extends CharacterBody2D


var speed = 200
func _physics_process(_delta: float) -> void:
	player_move()
	
	#if Input.is_action_pressed("player 1 move up"):
		#position.y -= 10 
	#if Input.is_action_pressed("player 1 move down"):
		#position.y += 10

func player_move():
	var dir:float = Input.get_axis("player 1 move up", "player 1 move down")
	velocity.y = dir * speed
	move_and_slide()
