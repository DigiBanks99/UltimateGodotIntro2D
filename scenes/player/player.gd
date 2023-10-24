extends CharacterBody2D

class_name Player

signal laser_fired
signal grenade_launched

var can_grenade: bool = true
var can_laser: bool = true
var speed: float = 500

@onready var laserTimer: Timer = $LaserTimer
@onready var grenadeTimer: Timer = $GrenadeTimer

func _process(_delta: float) -> void:
	# input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# attacking
	if Input.is_action_pressed("primary action") and can_laser:
		laser_fired.emit()
		can_laser = false
		laserTimer.start()

	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade_launched.emit()
		can_grenade = false
		grenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
