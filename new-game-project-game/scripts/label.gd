extends Label

func _process(_delta):
	if Globals.alive == false:
		text = "You Died!"
	else:
		text = " "
