extends Label

func _ready():
		text = " "

func _process(_delta):
	if Globals.can_enter:
		text = "                    Press E to enter level"
	elif Globals.not_enough_beaten:
		text = "Beat the previous level(s) to enter this level"
	else:
		text = " "
