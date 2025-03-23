class_name MainCharacter
extends CharacterBody2D

@export var parallax: Parallax2D

# movement variables
var speed : float = 5000
var jump : float = -10000
var fall_speed :float = 800
var slowout: float = 100
var input: bool = true
var moving_r: bool = false
var moving_l: bool = false

var health = 3

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hook: Node2D = $Hook


func _ready() -> void:
	input = true


func _physics_process(delta: float) -> void:
	# Base Controls
	gravity(delta)
	movement(delta)
	
	if moving_r:
		parallax.scroll_offset -= Vector2( 1, 0)
	elif moving_l:
		parallax.scroll_offset += Vector2( 1, 0)
	
	move_and_slide()


func gravity(delta) -> void:
	if not is_on_floor():
		velocity.y += fall_speed * delta 


func movement(delta) -> void:
	
	if input:
		# Jump
		if Input.is_action_just_pressed("Jump") && (is_on_floor() or hook.launched): 
			velocity.y += jump * delta
			hook.retract()
		
		# Movement
		if Input.is_action_pressed("Links"):
			velocity.x = -speed * delta
			moving_l = true
		else:
			velocity.x = move_toward(velocity.x, 0, slowout * delta)
			moving_l = false
			
		if Input.is_action_pressed("Rechts"):
			velocity.x = speed * delta	
			moving_r = true
		else:
			velocity.x = move_toward(velocity.x, 0, slowout * delta)
			moving_r = false

func damage(damage_value) -> void:
	health -= damage_value
	if health <= 0:
		health = 0
		input = false
		velocity = Vector2(0, 0)
		animated_sprite_2d.play("death")
		await animated_sprite_2d.animation_finished
		get_tree().reload_current_scene()
