extends CanvasLayer

var coins = 0
onready var Coins = $Coins

func _ready():
	update_coins()


func _on_coin_collected():
	coins += 1
	update_coins()

func update_coins():
	Coins.text = String(coins)
