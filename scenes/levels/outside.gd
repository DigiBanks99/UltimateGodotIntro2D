extends Level

func _on_gate_player_entered_gate(_body: Node2D) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.5)
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")


func _on_house_player_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(camera, 'zoom', Vector2(0.6, 0.6), 1)


func _on_house_player_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(camera, 'zoom', Vector2(0.4, 0.4), 1)
