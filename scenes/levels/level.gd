extends Node2D

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

@onready var player: Player = $Player
@onready var camera: Camera2D = $Player/Camera2D
@onready var projectiles_container: Node2D = $Projectiles

func _on_gate_player_entered_gate(_body: Node2D) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.5)

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


func _on_house_player_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(camera, 'zoom', Vector2(0.6, 0.6), 1)


func _on_house_player_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(camera, 'zoom', Vector2(0.4, 0.4), 1)
