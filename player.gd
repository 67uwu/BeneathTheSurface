extends CharacterBody2D

@export var SPEED = 15
@export var FRICTION = 0.9
@export var TOPSPEED = 100
var grav
var dead = false
const respawnPoint = Vector2(-128, -64)
var underwater = false
var doGravity = true
var inBoat = false

func _physics_process(delta: float) -> void:
	if(global_position.y >60):
		grav = 20
		underwater = true
	else:
		grav = 750
		underwater = false
	doGravity = true
	if (not is_on_floor() )and doGravity:
		velocity.y += grav * delta
	doMotion()
	respawn()
	move_and_slide()
	
func doMotion():
	if(!inBoat):
		visible = true
		var direction = Input.get_axis("ui_left", "ui_right")
		velocity.x += direction * SPEED
		velocity.x *= FRICTION
		if(abs(velocity.x) < 1):
			velocity.x = 0
		if(abs(velocity.y)>TOPSPEED and underwater):
			velocity.y = TOPSPEED
		if(Input.is_action_pressed("ui_accept") and underwater):
			velocity.y -= 100	
			doGravity = false
		else:
			doGravity = true
	else:
		doGravity = false
		global_position = $"../../Boat".global_position
		if(Input.is_action_just_pressed("ui_down")):
				position.y += 20
				inBoat = false
func respawn():
	if(dead):
		global_position = respawnPoint
		velocity = Vector2(0,0)
		
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	doGravity = false
	inBoat = true # Replace with function body.
	
 
