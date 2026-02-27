extends Label

func _ready():
		text = " "

func _process(_delta):
	if Globals.alive == false:
		text = "You Died!"
	else:
		text = " "
