extends KinematicBody2D
class_name Actor
var velocity: = Vector2(300,0)
func _physics_process(delta:float) -> void :
	move_and_slide(velocity)
	
	