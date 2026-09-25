extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _process(delta: float) -> void:
	scale = Vector2(GameManager.player_size, GameManager.player_size)
	if Input.is_action_just_pressed("Pause") and GameManager._state == GameManager.GAME_STATES.PLAYING:
		GameManager.pause()
	elif Input.is_action_just_pressed("Pause") and GameManager._state == GameManager.GAME_STATES.PAUSED:
		GameManager.unpause()

func _physics_process(delta: float) -> void:
	if GameManager._state == GameManager.GAME_STATES.PLAYING:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = GameManager.player_jump_velocity

		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * GameManager.player_speed
		else:
			velocity.x = move_toward(velocity.x, 0, GameManager.player_speed)

		move_and_slide()
		
		animated_sprite_2d.animation = "idle"
