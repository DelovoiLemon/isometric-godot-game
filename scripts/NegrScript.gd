extends CharacterBody2D

const SPEED = 10000.0
var isActive : bool = false
var sprintAvailable : bool = true

func _physics_process(delta):
	if isActive:
		handle_moveing(delta)

func _on_timer_timeout():
	sprintAvailable = true

func _changeActiveStatus(enable : bool):
	isActive = enable
	

func handle_moveing(delta):
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")	
	)
	if direction:
		velocity = direction * SPEED * delta
		if direction.y:
			$playerSprite.set_animation("up" if direction.y < 0 else "down")
	else:
		velocity = velocity.move_toward(Vector2(0, 0), SPEED * delta)
		
	move_and_slide()
