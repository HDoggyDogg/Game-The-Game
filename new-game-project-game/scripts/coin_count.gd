extends Label

func _ready():
	text = "Coins: 0"

func _process(_delta):
	text = "Coins: " + str(Globals.coins) + "\nJumps: " + str(Globals.max_jumps)
