extends Label

func _process(_delta):
	text = "Coins: " + str(Globals.coins)
