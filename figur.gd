extends KinematicBody2D

export (int) var speed = 128

var target = Vector2()
var velocity = Vector2()

func _input(event):
    if event.is_action_pressed('click'):
        target = get_global_mouse_position()

func _physics_process(delta):
    velocity = (target - position).normalized() * speed
    # rotation = velocity.angle()
    if (target - position).length() > 1:
        velocity = move_and_slide(velocity)

func _process(delta):
	if target.x < 512 && target.y < 512 && abs(target.x - position.x) < 96 && abs(target.y - position.y) < 96:
		target.x = int(target.x / 64) * 64 + 32
		target.y = int(target.y / 64) * 64 + 32
	else:
		target.x = position.x
		target.y = position.y

	
	