extends Node

var boss_presence = false
var boss_health = 0
var boss_maxhealth = 0
var critic_chance = 0
var stunIce = 0
var iceLevel = 0
const ICON_PATH = "res://Texturas/Items/Upgrades/"
const WEAPON_PATH = "res://Texturas/Items/Weapons/"
const UPGRADES = {
	"fireball1": {
		"icon": WEAPON_PATH + "fireBallIcon.png",
		"display": "Fire Ball",
		"details": "Uma bola de fogo é lançada em um alvo aleatório",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"fireball2": {
		"icon": WEAPON_PATH + "fireBallIcon.png",
		"display": "Fire Ball",
		"details": "Adicionalmente outra bola de fogo é lançada",
		"level": "Level: 2",
		"prerequisite": ["fireball1"],
		"type": "weapon"
	},
	"fireball3": {
		"icon": WEAPON_PATH + "fireBallIcon.png",
		"display": "Fire Ball",
		"details": "Bola de fogo atravessa 1 inimigo e causa +3 de dano",
		"level": "Level: 3",
		"prerequisite": ["fireball2"],
		"type": "weapon"
	},
	"fireball4": {
		"icon": WEAPON_PATH + "fireBallIcon.png",
		"display": "Fire Ball",
		"details": "Adicionalmente 2 bolas de fogo são lançadas",
		"level": "Level: 4",
		"prerequisite": ["fireball3"],
		"type": "weapon"
	},
	"ice1": {
		"icon": WEAPON_PATH + "iceIcon.png",
		"display": "Ice Storm",
		"details": "Lorem Ipsum",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"ice2": {
		"icon": WEAPON_PATH + "iceIcon.png",
		"display": "Ice Storm",
		"details": "Lorem Ipsum",
		"level": "Level: 2",
		"prerequisite": ["ice1"],
		"type": "weapon"
	},
	"ice3": {
		"icon": WEAPON_PATH + "iceIcon.png",
		"display": "Ice Storm",
		"details": "Lorem Ipsum",
		"level": "Level: 3",
		"prerequisite": ["ice2"],
		"type": "weapon"
	},
	"ice4": {
		"icon": WEAPON_PATH + "iceIcon.png",
		"display": "Ice Storm",
		"details": "Lorem Ipsum",
		"level": "Level: 4",
		"prerequisite": ["ice3"],
		"type": "weapon"
	},
	"sand1": {
		"icon": WEAPON_PATH + "sandIcon.png",
		"display": "Sand Tornado",
		"details": "Lorem Ipsum",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"sand2": {
		"icon": WEAPON_PATH + "sandIcon.png",
		"display": "Sand Tornado",
		"details": "Lorem Ipsum",
		"level": "Level: 2",
		"prerequisite": ["sand1"],
		"type": "weapon"
	},
	"sand3": {
		"icon": WEAPON_PATH + "sandIcon.png",
		"display": "Sand Tornado",
		"details": "Lorem Ipsum",
		"level": "Level: 3",
		"prerequisite": ["sand2"],
		"type": "weapon"
	},
	"sand4": {
		"icon": WEAPON_PATH + "sandIcon.png",
		"display": "Sand Tornado",
		"details": "Lorem Ipsum",
		"level": "Level: 4",
		"prerequisite": ["sand3"],
		"type": "weapon"
	},
	"thunder1": {
		"icon": WEAPON_PATH + "lightningAttackIcon.png",
		"display": "Thunder Strike",
		"details": "Lorem Ipsum",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"thunder2": {
		"icon": WEAPON_PATH + "lightningAttackIcon.png",
		"display": "Thunder Strike",
		"details": "Lorem Ipsum",
		"level": "Level: 2",
		"prerequisite": ["thunder1"],
		"type": "weapon"
	},
	"thunder3": {
		"icon": WEAPON_PATH + "lightningAttackIcon.png",
		"display": "Thunder Strike",
		"details": "Lorem Ipsum",
		"level": "Level: 3",
		"prerequisite": ["thunder2"],
		"type": "weapon"
	},
	"thunder4": {
		"icon": WEAPON_PATH + "lightningAttackIcon.png",
		"display": "Thunder Strike",
		"details": "Lorem Ipsum",
		"level": "Level: 4",
		"prerequisite": ["thunder3"],
		"type": "weapon"
	},
	"poison1": {
		"icon": WEAPON_PATH + "greenFireBallIcon.png",
		"display": "Poison Cloud",
		"details": "Lorem Ipsum",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"poison2": {
		"icon": WEAPON_PATH + "greenFireBallIcon.png",
		"display": "Poison Cloud",
		"details": "Lorem Ipsum",
		"level": "Level: 2",
		"prerequisite": ["poison1"],
		"type": "weapon"
	},
	"poison3": {
		"icon": WEAPON_PATH + "greenFireBallIcon.png",
		"display": "Poison Cloud",
		"details": "Lorem Ipsum",
		"level": "Level: 3",
		"prerequisite": ["poison2"],
		"type": "weapon"
	},
	"poison4": {
		"icon": WEAPON_PATH + "greenFireBallIcon.png",
		"display": "Poison Cloud",
		"details": "Lorem Ipsum",
		"level": "Level: 4",
		"prerequisite": ["poison3"],
		"type": "weapon"
	},
	"armor1": {
		"icon": ICON_PATH + "powerUpShield.png",
		"display": "Armor",
		"details": "Reduz o dano recebido em 1 ponto",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"armor2": {
		"icon": ICON_PATH + "powerUpShield.png",
		"display": "Armor",
		"details": "Reduz o dano recebido em 1 ponto adicional",
		"level": "Level: 2",
		"prerequisite": ["armor1"],
		"type": "upgrade"
	},
	"armor3": {
		"icon": ICON_PATH + "powerUpShield.png",
		"display": "Armor",
		"details": "Reduz o dano recebido em 1 ponto adicional",
		"level": "Level: 3",
		"prerequisite": ["armor2"],
		"type": "upgrade"
	},
	"armor4": {
		"icon": ICON_PATH + "powerUpShield.png",
		"display": "Armor",
		"details": "Reduz o dano recebido em 1 ponto adicional",
		"level": "Level: 4",
		"prerequisite": ["armor3"],
		"type": "upgrade"
	},
	"speed1": {
		"icon": ICON_PATH + "powerUpSpeed.png",
		"display": "Speed",
		"details": "Velocidade de movimento aumenta em 50% da velocidade base",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"speed2": {
		"icon": ICON_PATH + "powerUpSpeed.png",
		"display": "Speed",
		"details": "Velocidade de movimento aumenta em mais 50% da velocidade base",
		"level": "Level: 2",
		"prerequisite": ["speed1"],
		"type": "upgrade"
	},
	"speed3": {
		"icon": ICON_PATH + "powerUpSpeed.png",
		"display": "Speed",
		"details": "Velocidade de movimento aumenta em mais 50% da velocidade base",
		"level": "Level: 3",
		"prerequisite": ["speed2"],
		"type": "upgrade"
	},
	"speed4": {
		"icon": ICON_PATH + "powerUpSpeed.png",
		"display": "Speed",
		"details": "Velocidade de movimento aumenta em mais 50% da velocidade base",
		"level": "Level: 4",
		"prerequisite": ["speed3"],
		"type": "upgrade"
	},
	"Cooldown1": {
		"icon": ICON_PATH + "powerUpCooldown.png",
		"display": "Cooldown",
		"details": "Diminui o cooldown para todos os ataques em 10%",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"Cooldown2": {
		"icon": ICON_PATH + "powerUpCooldown.png",
		"display": "Cooldown",
		"details": "Diminui o cooldown para todos os ataques em mais 10%",
		"level": "Level: 2",
		"prerequisite": ["Cooldown1"],
		"type": "upgrade"
	},
	"Cooldown3": {
		"icon": ICON_PATH + "powerUpCooldown.png",
		"display": "Cooldown",
		"details": "Diminui o cooldown para todos os ataques em mais 10%",
		"level": "Level: 3",
		"prerequisite": ["Cooldown2"],
		"type": "upgrade"
	},
	"Cooldown4": {
		"icon": ICON_PATH + "powerUpCooldown.png",
		"display": "Cooldown",
		"details": "Diminui o cooldown para todos os ataques em mais 10%",
		"level": "Level: 4",
		"prerequisite": ["Cooldown3"],
		"type": "upgrade"
	},
	"AttackSize1": {
		"icon": ICON_PATH + "powerUpSize.png",
		"display": "Size Up",
		"details": "Aumenta em 15% o tamanho dos ataques",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"AttackSize2": {
		"icon": ICON_PATH + "powerUpSize.png",
		"display": "Size Up",
		"details": "Aumenta em mais 15% o tamanho dos ataques",
		"level": "Level: 2",
		"prerequisite": ["AttackSize1"],
		"type": "upgrade"
	},
	"AttackSize3": {
		"icon": ICON_PATH + "powerUpSize.png",
		"display": "Size Up",
		"details": "Aumenta em mais 15% o tamanho dos ataques",
		"level": "Level: 3",
		"prerequisite": ["AttackSize2"],
		"type": "upgrade"
	},
	"AttackSize4": {
		"icon": ICON_PATH + "powerUpSize.png",
		"display": "Size Up",
		"details": "Aumenta em mais 15% o tamanho dos ataques",
		"level": "Level: 4",
		"prerequisite": ["AttackSize3"],
		"type": "upgrade"
	},
	"MaxHealth1": {
		"icon": ICON_PATH + "powerUpVida.png",
		"display": "Vida Máxima",
		"details": "Aumenta a vida máxima em 15 pontos",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"MaxHealth2": {
		"icon": ICON_PATH + "powerUpVida.png",
		"display": "Vida Máxima",
		"details": "Aumenta a vida máxima em mais 15 pontos",
		"level": "Level: 2",
		"prerequisite": ["MaxHealth1"],
		"type": "upgrade"
	},
	"MaxHealth3": {
		"icon": ICON_PATH + "powerUpVida.png",
		"display": "Vida Máxima",
		"details": "Aumenta a vida máxima em mais 15 pontos",
		"level": "Level: 3",
		"prerequisite": ["MaxHealth2"],
		"type": "upgrade"
	},
	"MaxHealth4": {
		"icon": ICON_PATH + "powerUpVida.png",
		"display": "Vida Máxima",
		"details": "Aumenta a vida máxima em mais 15 pontos",
		"level": "Level: 4",
		"prerequisite": ["MaxHealth3"],
		"type": "upgrade"
	},
	"Critic1": {
		"icon": ICON_PATH + "powerUpCritic.png",
		"display": "Crítico",
		"details": "Chance de crítico igual 10%",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"Critic2": {
		"icon": ICON_PATH + "powerUpCritic.png",
		"display": "Crítico",
		"details": "Aumenta a chance de crítico em mais 10%",
		"level": "Level: 2",
		"prerequisite": ["Critico1"],
		"type": "upgrade"
	},
	"Critic3": {
		"icon": ICON_PATH + "powerUpCritic.png",
		"display": "Crítico",
		"details": "Aumenta a chance de crítico em mais 10%",
		"level": "Level: 3",
		"prerequisite": ["Critico2"],
		"type": "upgrade"
	},
	"Critic4": {
		"icon": ICON_PATH + "powerUpCritic.png",
		"display": "Crítico",
		"details": "Aumenta a chance de crítico em mais 10%",
		"level": "Level: 4",
		"prerequisite": ["Critico3"],
		"type": "upgrade"
	},
	"food": {
		"icon": ICON_PATH + "regenLife.png",
		"display": "Food",
		"details": "Recupera 20 da vida atual",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
