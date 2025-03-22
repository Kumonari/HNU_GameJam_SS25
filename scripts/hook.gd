extends Node2D


@export var rest_length = 0
@export var stiffness = 25
@export var damping_value = 10

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var player := get_parent()
@onready var ray := $RayCast2D
@onready var rope := $Line2D
@onready var hand: Sprite2D = $Hand

var launched = false
var target: Vector2

func _process(delta):
	ray.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("l_click"):
		launch()
		animated_sprite_2d.play("hooking")
	
	if Input.is_action_just_released("l_click"):
		retract()
		animated_sprite_2d.play("idle")
	
	if launched:
		handle_grapple(delta)

func launch():
	if ray.is_colliding():
		launched = true
		target = ray.get_collision_point()
		rope.show()
		hand.show()

func retract():
	launched = false
	rope.hide()
	hand.hide()
	

func handle_grapple(delta):
	var target_dir = player.global_position.direction_to(target)
	var target_dist = player.global_position.distance_to(target)
	
	var displacement = target_dist - rest_length
	
	var force = Vector2.ZERO
	
	if displacement > 0:
		var spring_force_magnitude = stiffness * displacement
		var spring_force = target_dir * spring_force_magnitude
		
		var vel_dot = player.velocity.dot(target_dir)
		var damping = -damping_value * vel_dot * target_dir
		
		force = spring_force + damping
	
	player.velocity += force * delta
	update_rope()

func update_rope():
	rope.set_point_position(1, to_local(target))
	hand.position = to_local(target)
