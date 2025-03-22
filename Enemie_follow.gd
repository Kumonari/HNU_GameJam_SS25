extends CharacterBody2D

var speed = 2000
var jump = -15000
var direction
var gravity = 800
var time = 0.0

func _physics_process(delta):
	if is_on_floor():
		$AnimatedSprite2D.play("default")
	time += delta
	if time >= 1.0:
		time = 0.0
		Jump(delta)
		$AnimatedSprite2D.play("jump")

	if not is_on_floor():
		velocity.y += gravity * delta
	if player.global_position.x == global_position.x - 110:
		velocity.x = 0
	move_and_slide()
		
func Jump(delta):
	velocity.y += jump * delta
	if player.global_position.x > global_position.x - 110:
		velocity.x = speed * delta
	elif player.global_position.x < global_position.x - 110:
		velocity.x = -speed * delta
