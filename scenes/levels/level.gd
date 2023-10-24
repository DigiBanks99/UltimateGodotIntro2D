extends Node2D

func _on_gate_player_entered_gate(body: Node2D) -> void:
	print('player has entered the gate')


func _on_player_laser_fired() -> void:
	print('laser fired by player')


func _on_player_grenade_launched() -> void:
	print('grenade launched by player')
