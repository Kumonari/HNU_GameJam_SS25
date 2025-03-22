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
var arm_lenght: float = 320 # should equal $Hook.raycast1.target_position_x
var current_arm_lenght: float
var swing_speed: float = 0.45
var hook_speed: float = 2500

var health = 3


func _ready() -> void:
	current_arm_lenght = arm_lenght


func _physics_process(delta: float) -> void:
	# Base Controls
	gravity(delta)
	movement(delta)
	
	# Hook logic
	hook()
	if hooked:
		swing(delta)
		velocity *= swing_speed
		
	move_and_slide()


func _draw() -> void:
	var pos = global_position
	
	if hooked:
		draw_line(Vector2(0,-16), to_local(hook_pos), Color(0.35, 0.7, 0.9), 3, true)
	else:
		return
		
		var colliding = hook_node.is_colliding()
		var collide_point = hook_node.get_collision_point()
		if colliding and pos.distance_to(collide_point) < arm_lenght:
			draw_line(Vector2(0, -16), to_local(collide_point), Color(1, 1, 1, 0.25), 0.5, true)


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


func hook() -> void:
	if hook_node:
		hook_node.look_at(get_global_mouse_position())
		if Input.is_action_pressed("l_click"):
			hook_pos = get_hook_pos()
			if not hook_pos == Vector2.ZERO:
				hooked = true
				current_arm_lenght = global_position.distance_to(hook_pos)
		if Input.is_action_just_released("l_click") and hooked:
			hooked = false


func get_hook_pos() -> Vector2:
	for raycast in hook_node.get_children():
		if raycast.is_colliding():
			return raycast.get_collision_point()
	
	return Vector2.ZERO


func swing(delta) ->void:
	var radius = global_position - hook_pos
	if velocity.length() < 0.01 or radius.length() < 10: return
	var angle = acos(radius.dot(velocity)) / (radius.length() * velocity.length())
	var rad_vel = cos(angle) * velocity.length()
	velocity += radius.normalized() * -rad_vel
	
	if global_position.distance_to(hook_pos) > current_arm_lenght:
		global_position = hook_pos + radius.normalized() * current_arm_lenght
		
	velocity += (hook_pos - global_position).normalized() * hook_speed * delta
