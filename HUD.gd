extends CanvasLayer

var coins = 0
export var coins_to_win = 10
onready var Coins = $Coins

onready var LEVEL_FINISHED = preload("res://src/scenes/Level_finished.tscn")

func _ready():
	update_coins()


func _on_coin_collected():
	coins += 1
	update_coins()
	
	if coins == coins_to_win:
		if (get_parent().get_node("Character")):
			get_parent().get_node("Character").isQuiet = true
		if (get_parent().get_node("Character2")):
			get_parent().get_node("Character2").isQuiet = true
		if (get_parent().get_node("Enemy1")):
			get_parent().get_node("Enemy1").isQuiet = true
		if (get_parent().get_node("Enemy2")):
			get_parent().get_node("Enemy2").isQuiet = true
		var levelFinished = LEVEL_FINISHED.instance()
		levelFinished.levelName = "Level_2.tscn"
		get_parent().add_child(levelFinished)

func update_coins():
	Coins.text = String(coins)
