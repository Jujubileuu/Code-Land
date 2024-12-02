extends Area2D

var level = 1
var healph = 9999
var speed = 200
var damage = 1
var knockback_amount = 150
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")
signal remove_from_array(object)

func _ready():
	connect("body_entered", Callable(self, "_on_Attack_body_entered"))
	angle = global_position.direction_to(target)
	rotation = angle.angle()
	
	match level:
		1:
			healph = 9999
			speed = 200
			damage = 1
			knockback_amount = 150
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			healph = 9999
			speed = 200
			damage = 1
			knockback_amount = 150
			attack_size = 1.0 * (1 + player.spell_size)
		3:
			healph = 9999
			speed = 200
			damage = 1
			knockback_amount = 150
			attack_size = 1.0 * (1 + player.spell_size)
		4:
			healph = 9999
			speed = 200
			damage = 1
			knockback_amount = 150
			attack_size = 1.0 * (1 + player.spell_size)

	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(2, 2) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func _physics_process(delta):
	if speed > 0:
		position += angle * speed * delta

func _on_Attack_body_entered(body):
	if body.is_in_group("enemy"):
		speed = 0  # Stop the attack movement
		enemy_hit()
		emit_signal("remove_from_array", self)
		queue_free()

func enemy_hit(charge = 1):
	healph -= charge
	speed = 0
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(2.5, 2.5) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	if healph <= 0:
		emit_signal("remove_from_array", self)
		queue_free()

func _on_timer_timeout():
	emit_signal("remove_from_array", self)
	queue_free()
