class_name MainCharacter
extends CharacterBody2D

@onready var jumpcount : int = 0
@onready var speed : float = 200
@onready var jump : float = -200
@onready var gravity :float = 800
@onready var slowout: float = 10

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta 
		
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump
		jumpcount = +1
		if jumpcount < 2:
			velocity.y = jump
	
	if is_on_floor():
		jumpcount = 0
		
	if Input.is_action_pressed("Links"):
		velocity.x = -speed
	
	else:
		velocity.x = move_toward(velocity.x, 0, slowout)
		
	if Input.is_action_pressed("Rechts"):
		velocity.x = speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, slowout)
		
	move_and_slide()
