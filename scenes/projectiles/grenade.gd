extends RigidBody2D

class_name Grenade

const speed: int = 1000

@onready var explosion: Sprite2D = $Explosion
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func explode() -> void:
	explosion.visible = true
	animation_player.play("explosion")
