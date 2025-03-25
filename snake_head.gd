extends Node2D

var speed = 80
var direction = Vector2.RIGHT
var position_history: Array = []

func _ready():
	# 처음 시작할 때 현재 위치를 100개 채워 넣음
	for i in range(100):
		position_history.append(position)

func _physics_process(delta):  # 물리 프레임에서 처리
	position += direction * speed * delta

	# head가 지나온 위치 저장
	position_history.insert(0, position)
	if position_history.size() > 100:
		position_history.resize(100)

	# 🧪 디버깅용 로그: 15프레임마다 한 번 출력
	if Engine.get_frames_drawn() % 15 == 0:
		print("--- SnakeHead 디버깅 ---")
		print("현재 위치:", position)
		print("position_history[0]:", position_history[0])
		print("position_history[10]:", position_history[10] if position_history.size() > 10 else "없음")
		print("position_history size:", position_history.size())

func _unhandled_input(event):
	if event.is_action_pressed("ui_up") and direction != Vector2.DOWN:
		direction = Vector2.UP
	elif event.is_action_pressed("ui_down") and direction != Vector2.UP:
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left") and direction != Vector2.RIGHT:
		direction = Vector2.LEFT
	elif event.is_action_pressed("ui_right") and direction != Vector2.LEFT:
		direction = Vector2.RIGHT
