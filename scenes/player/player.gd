extends CharacterBody2D

class_name Player

var speed: float = 500

func _process(_delta: float) -> void:
	# input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# attacking
	if Input.is_action_pressed("primary action"):
		print("shoot!")
	if Input.is_action_pressed("secondary action"):
		print("throw grenade!")
