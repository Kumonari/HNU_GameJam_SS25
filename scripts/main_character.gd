class_name MainCharacter
extends CharacterBody2D


# movement variables
var speed : float = 5000
var jump : float = -10000
var fall_speed :float = 800
var slowout: float = 100
var health = 3

#@onready var hook: Node2D = MainCharacter.find_children("Hook")

func _physics_process(delta: float) -> void:
	# Base Controls
	gravity(delta)
	movement(delta)

	move_and_slide()


func gravity(delta) -> void:
	if not is_on_floor():
		velocity.y += fall_speed * delta 
	

func movement(delta) -> void:
	# Jump
	if Input.is_action_just_pressed("Jump") && (is_on_floor()):  #or hook.launched
		velocity.y += jump * delta
		#hook.retract
	
	# Movement
	if Input.is_action_pressed("Links"):
		velocity.x = -speed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, slowout * delta)
		
	if Input.is_action_pressed("Rechts"):
		velocity.x = speed * delta	
	else:
		velocity.x = move_toward(velocity.x, 0, slowout * delta)
