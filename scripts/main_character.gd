class_name MainCharacter
extends CharacterBody2D


@export var hook_node: Node2D

# movement variables
var speed : float = 5000
var jump : float = -10000
var falls_speed :float = 800
var slowout: float = 100

# hook variables
var hook_pos: Vector2
var hooked: bool = false
var arm_lenght: float = 500 # should equal $Hook.raycast1.target_position_x
var current_arm_lenght: float 

var health = 3


func _ready() -> void:
	current_arm_lenght = arm_lenght




func _physics_process(delta: float) -> void:
	# Base Controls
	gravity(delta)
	movement(delta)
	
	#hook(delta)
	
	
	
	move_and_slide()


func gravity(delta) -> void:
	if not is_on_floor():
		velocity.y += falls_speed * delta 


func movement(delta) -> void:
	# Jump
	if Input.is_action_just_pressed("Jump") && is_on_floor() :
		velocity.y = jump * delta
	
	# Movement
	if Input.is_action_pressed("Links"):
		velocity.x = -speed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, slowout * delta)
		
	if Input.is_action_pressed("Rechts"):
		velocity.x = speed * delta	
	else:
		velocity.x = move_toward(velocity.x, 0, slowout * delta)


#func hook(delta) -> void:
	#if hook_node:
		#hook_node.look_at(get_global_mouse_position())
		#if Input.is_action_pressed("l_click"):
			#hook_pos = get_hook_pos()
			#if hook_pos:
				#hooked = true
				#current_arm_lenght = global_position.distance_to(hook_pos)
