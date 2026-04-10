extends Node

var coins = 0
var alive: bool = true
var max_jumps = 1
var has_dark = false
var pos = 20
var y_offset = 70
var can_enter = false
var levels_beat = 0
var not_enough_beaten = false
var secrets_found = 0
var gravity_direction = 1
var boot_move = -190

func reset():
	alive = true
	coins = 0
	max_jumps = 1
	pos = 20
	y_offset = 70
	gravity_direction = 1
	boot_move = -190
