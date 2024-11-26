extends Node

const ICON_PATH = "res://Texturas/Items/Upgrades/"
const WEAPON_PATH = "res://Texturas/Items/Weapons/"
const UPGRADES = {
	"fireball1": {
		"icon": ICON_PATH + "refriAmarelo.png",
		"display": "Fire Ball",
		"details": "A ball of fire is thrown at a random enemy",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"fireball2": {
		"icon": ICON_PATH + "refriAmarelo.png",
		"display": "Fire Ball",
		"details": "A addition Fire Ball is thrown",
		"level": "Level: 2",
		"prerequisite": ["fireball1"],
		"type": "weapon"
	},
	"fireball3": {
		"icon": ICON_PATH + "refriAmarelo.png",
		"display": "Fire Ball",
		"details": "Fire Ball now pass through another enemy and do +3 damage",
		"level": "Level: 3",
		"prerequisite": ["fireball2"],
		"type": "weapon"
	},
	"fireball4": {
		"icon": ICON_PATH + "refriAmarelo.png",
		"display": "Fire Ball",
		"details": "An additional 2 Fire Ball are thrown",
		"level": "Level: 4",
		"prerequisite": ["fireball3"],
		"type": "weapon"
	},
	"armor1": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Armor",
		"details": "Reduces damage by 1 point",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"armor2": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Armor",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 2",
		"prerequisite": ["armor1"],
		"type": "upgrade"
	},
	"armor3": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Armor",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 3",
		"prerequisite": ["armor2"],
		"type": "upgrade"
	},
	"armor4": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Armor",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 4",
		"prerequisite": ["armor3"],
		"type": "upgrade"
	},
	"speed1": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Speed",
		"details": "Movement speed increased by 50% of base speed",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"speed2": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Speed",
		"details": "Movement speed increased an addicional 50% of base speed",
		"level": "Level: 2",
		"prerequisite": ["speed1"],
		"type": "upgrade"
	},
	"speed3": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Speed",
		"details": "Movement speed increased an addicional 50% of base speed",
		"level": "Level: 3",
		"prerequisite": ["speed2"],
		"type": "upgrade"
	},
	"speed4": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Speed",
		"details": "Movement speed increased an addicional 50% of base speed",
		"level": "Level: 4",
		"prerequisite": ["speed3"],
		"type": "upgrade"
	},
	"food": {
		"icon": ICON_PATH + "refriVermelho.png",
		"display": "Food",
		"details": "Heals you for 20 health",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
