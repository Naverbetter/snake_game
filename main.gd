extends Node2D

func _process(delta):
	var head = $SnakeHead
	var bodies = [$SnakeBody, $SnakeBody2, $SnakeBody3]

	for i in range(bodies.size()):
		var body = bodies[i]

		# body가 snake_body.gd를 가지고 있는지 확인
		if body.has_method("set_target_position"):
			var index = (i + 1) * 10
			
			print("=== body ===")
			print("이름:", body.name)
			print("인덱스:", index)
			print("position_history size:", head.position_history.size())
			print("---")
		
			if head.position_history.size() > index:
				body.set_target_position(head.position_history[index])
		
				
