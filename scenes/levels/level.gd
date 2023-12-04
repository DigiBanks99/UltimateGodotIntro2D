extends Node2D

class_name Level

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

@onready var player: Player = $Player
@onready var camera: Camera2D = $Player/Camera2D
@onready var projectiles_container: Node2D = $Projectiles

func _on_player_laser_fired(pos: Vector2, dir: Vector2) -> void:
	var laser: Laser = laser_scene.instantiate() as Laser
	laser.position = pos
	laser.direction = dir
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	projectiles_container.add_child(laser)


func _on_player_grenade_launched(pos: Vector2, dir: Vector2) -> void:
	var grenade: Grenade = grenade_scene.instantiate() as Grenade
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	projectiles_container.add_child(grenade)
