extends CharacterBody2D

var speed: float = 250

func _process(_delta: float) -> void:
	velocity = Vector2.RIGHT * speed
	move_and_slide()
