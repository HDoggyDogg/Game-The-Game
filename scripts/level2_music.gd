extends AudioStreamPlayer
@onready var song: AudioStreamPlayer = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	song.play()
