extends Level


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.5)
