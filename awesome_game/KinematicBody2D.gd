extends KinematicBody2D
var velocity: = Vector2(0,0)
var acceleration: = 5
var time = 0
var cooldown = 70

func _physics_process(delta:float) -> void :
	move_and_slide(velocity)
	var joueurPos = get_position()
	var ballePos = get_node("balle/corps").get_position()
	ballePos += joueurPos
	var dashDirection = Vector2 (ballePos.x - joueurPos.x, ballePos.y - joueurPos.y)
	
	if Input.is_action_pressed("ui_left"):
		velocity.x-=acceleration
	if Input.is_action_pressed("ui_right"):
		velocity.x+=acceleration
	if Input.is_action_pressed("ui_down"):
		velocity.y+=acceleration
	if Input.is_action_pressed("ui_up"):
		velocity.y-=acceleration
		
	if Input.is_key_pressed(KEY_C) and time == 0:
		velocity =dashDirection.normalized()*sqrt(pow(velocity.x,2)+pow(velocity.y,2))
		time = cooldown
	if Input.is_key_pressed(KEY_X):
		velocity = velocity*0.9
	if Input.is_key_pressed(KEY_W):
		velocity = velocity*0.95
	if time>0:
		time-=1
	if is_on_wall():
		velocity = velocity*0.9

