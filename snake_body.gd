extends Node2D

var target_position: Vector2 = Vector2.ZERO

func _process(delta):
	if position.distance_to(target_position) > 0.1:  # 너무 가깝지 않을 때만 이동
		position = position.move_toward(target_position, 80 * delta)  # 속도 ↓

func set_target_position(pos: Vector2):
	target_position = pos
