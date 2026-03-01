extends CharacterBody2D


const SPEED = 100
var start_pos
var health = 2
var time =0



func _ready() -> void:
	start_pos = global_position
	velocity = Vector2(SPEED, 0)


func _physics_process(delta: float) -> void:
	visible = true
	
	if(time<2000*delta):#four tiles
		velocity.x *=-1
		time += 1
	else:
		velocity.x*= -1
		time = 0
	move_and_slide()
	

	
