extends Area2D

var level = 1
var healph = 1
var speed = 200
var damage = 5
var knockback_amount = 150
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")
signal remove_from_array(object)

func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() #+ deg_to_rad(135)
	match level:
		1:
			healph = 1 #2 atravessa 1 inimigo e some no próximo
			speed = 200
			damage = 5
			knockback_amount = 50
			attack_size = 0.25 * (1 + player.spell_size)
		2:
			healph = 1 #2 atravessa 1 inimigo e some no próximo
			speed = 225
			damage = 10
			knockback_amount = 100
			attack_size = 0.50 * (1 + player.spell_size)
		3:
			healph = 2 #2 atravessa 1 inimigo e some no próximo
			speed = 250
			damage = 15
			knockback_amount = 150
			attack_size = 0.75 * (1 + player.spell_size)
		4:
			healph = 2 #2 atravessa 1 inimigo e some no próximo
			speed = 275
			damage = 20
			knockback_amount = 200
			attack_size = 1.0 * (1 + player.spell_size)
		5:
			healph = 3 #2 atravessa 1 inimigo e some no próximo
			speed = 300
			damage = 25
			knockback_amount = 250
			attack_size = 1.25 * (1 + player.spell_size)
		6:
			healph = 3 #2 atravessa 1 inimigo e some no próximo
			speed = 325
			damage = 30
			knockback_amount = 300
			attack_size = 1.50 * (1 + player.spell_size)
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1,1)*attack_size,1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func _physics_process(delta):
	position += angle*speed*delta

func enemy_hit(charge = 1):
	healph -= charge
	if healph <= 0:
		emit_signal("remove_from_array", self)
		queue_free()

func _on_timer_timeout():
	emit_signal("remove_from_array", self)
	queue_free()
