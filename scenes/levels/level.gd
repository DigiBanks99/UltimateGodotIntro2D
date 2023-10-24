extends Node2D

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(_body: Node2D) -> void:
	print('player entered the gate')

func _on_player_laser_fired(pos: Vector2, dir: Vector2) -> void:
	var laser: Laser = laser_scene.instantiate() as Laser
	laser.position = pos
	laser.direction = dir
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$Projectiles.add_child(laser)


func _on_player_grenade_launched(pos: Vector2, dir: Vector2) -> void:
	var grenade: Grenade = grenade_scene.instantiate() as Grenade
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)
