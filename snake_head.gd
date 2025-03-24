extends Node2D

var speed = 100
var direction = Vector2.RIGHT

func _process(delta):
	position += direction * speed * delta

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		direction = Vector2.UP
	elif event.is_action_pressed("ui_down"):
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	elif event.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
