extends Sprite2D

var inBoat = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(inBoat):
		var direction = Input.get_axis("ui_left", "ui_right")
		position.x += direction*10 # Replace with function body.

func _on_area_2d_body_entered(body: Node2D) -> void:
	inBoat = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	inBoat = false # Replace with function body.
