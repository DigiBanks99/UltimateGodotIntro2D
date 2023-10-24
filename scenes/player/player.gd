extends CharacterBody2D

class_name Player

signal laser_fired(pos: Vector2, dir: Vector2)
signal grenade_launched(pos: Vector2, dir: Vector2)

var can_grenade: bool = true
var can_laser: bool = true
var speed: float = 500

@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer
@onready var _projectile_markers: Array[Node] = $ProjectileStartPositions.get_children()

func _process(_delta: float) -> void:
	# input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# rotate
	look_at(get_global_mouse_position())

	# attacking
	_handle_attack_input()


func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
	
func _get_projectile_marker() -> Marker2D:
	# random index between 0 to laser_markers.size exclusive
	return _projectile_markers[randi() % _projectile_markers.size()] as Marker2D

func _get_projectile_direction() -> Vector2:
	return (get_global_mouse_position() - position).normalized()

func _handle_attack_input() -> void:
	var selected_marker: Marker2D = _get_projectile_marker()
	var player_direction: Vector2 = _get_projectile_direction()

	if Input.is_action_pressed("primary action") and can_laser:
		laser_fired.emit(selected_marker.global_position, player_direction)
		can_laser = false
		laser_timer.start()

	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade_launched.emit(selected_marker.global_position, player_direction)
		can_grenade = false
		grenade_timer.start()
