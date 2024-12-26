extends CharacterBody2D

var move_speed : float = 150.0
var jump_force : float = 250.0
var gravity : float = 600.0

var score : int = 0
@onready var score_text : Label = get_node("CanvasLayer/ScoreText")
@onready var timer: = $Timer

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_A):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_D):
		velocity.x += move_speed
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jump_force
	
	move_and_slide()
	
	if global_position.y >700:
		$Fall.play()
		game_over()
	
func game_over ():
	set_physics_process(false)
	get_node("../BG").stop()
	timer.start()
	
	
func add_score (amount):
	score += amount
	score_text.text = str("Score: ", score)


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
