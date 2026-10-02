extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true


func _physics_process(delta: float) -> void:
	movement(delta)
	enemy_attack()
	if Input.is_action_just_pressed("Hurt"):
		GameManager.damage()
	if Input.is_action_just_pressed("Heal"):
		GameManager.heal()
	if Input.is_action_just_pressed("Add"):
		GameManager.add_item()

func movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = GameManager.player_jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * GameManager.player_speed
	else:
		velocity.x = move_toward(velocity.x, 0, GameManager.player_speed)

	move_and_slide()
func player():
	pass

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		GameManager.damage()
		enemy_attack_cooldown = false
		$AttackCooldown.start()


func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
