extends CharacterBody2D #21:04

var movement_speed = 160.0
var healph = 100

var experience = 0
var experience_level = 1
var collected_experience = 0

var fireBall = preload("res://Jogador/attacks/fireball.tscn")
@onready var fireBallTimer = get_node("Attack/FireBallTimer")
@onready var fireBallAttackTimer = get_node("Attack/FireBallTimer/FireBallAttackTimer")

var fireball_ammo = 0
var fireball_baseammo = 1
var fireball_attackspeed = 1.5
var fireball_level = 1

var enemy_close = []

@onready var sprite = $Sprite2D

func _ready():
	attack()

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0:
		sprite.flip_h = true
	velocity = mov.normalized()*movement_speed
	move_and_slide()

func attack():
	if fireball_level > 0:
		fireBallTimer.wait_time = fireball_attackspeed
		if fireBallTimer.is_stopped():
			fireBallTimer.start()

func _on_hurt_box_hurt(damage, _angle, _knockback):
	healph -= damage
	print(healph)


func _on_fire_ball_timer_timeout():
	fireball_ammo += fireball_baseammo
	fireBallAttackTimer.start()


func _on_fire_ball_attack_timer_timeout():
	if fireball_ammo > 0:
		var fireball_attack = fireBall.instantiate()
		fireball_attack.position = position
		fireball_attack.target = get_random_target()
		fireball_attack.level = fireball_level
		add_child(fireball_attack)
		fireball_ammo -= 1
		if fireball_ammo > 0:
			fireBallAttackTimer.start()
		else:
			fireBallAttackTimer.stop()

func get_random_target():
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP


func _on_enemy_detection_area_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)


func _on_enemy_detection_area_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)


func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

func _on_collect_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("loot"):
		var gem_exp = area.collect()
		calculate_experience(gem_exp)

func calculate_experience(gem_exp):
	var exp_required = calculate_experiencecap()
	collected_experience += gem_exp
	if experience + collected_experience >= exp_required:
		collected_experience -= exp_required-experience
		experience_level += 1
		print("Level", experience_level)
		experience = 0
		exp_required = calculate_experiencecap()
		calculate_experience(0)
	else: 
		experience += collected_experience
		collected_experience = 0

func calculate_experiencecap():
	var exp_cap = experience_level
	if experience_level < 20:
		exp_cap = experience_level+5
	elif experience_level < 40:
		exp_cap + 95 * (experience_level-19)*8
	else:
		exp_cap = 255 + (experience_level-39)*12
	return exp_cap
