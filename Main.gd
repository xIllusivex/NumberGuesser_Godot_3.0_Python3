extends Node

# 0 - 1000
# randi function returns a random number randi()%11+1

var num
var minGuess = 1
var maxGuess = 1000
var end = false

func _ready():
	num = (minGuess + maxGuess) / 2
	print("----------------")
	print("----------------")
	print("----------------")
	print("Hello welcome to number guesser")
	print("guess a number between one and one-thousand")
	print("is " + str(num) + " your number ?")
func _process(delta):
	if Input.is_action_just_pressed("up"):
		_tryGuess("up")
	elif Input.is_action_just_pressed("down"):
		_tryGuess("down")
	elif Input.is_action_just_pressed("restart"):
		if (end):
			restartGame()
		else:
			endGame()
func _tryGuess(type):
	if type == "up":
		minGuess = num
	else:
		maxGuess = num
	num = (minGuess + maxGuess) / 2
	print("is " + str(num) + " your number ?")
func endGame():
	end = true
	print("Yes! your number was " + str(num) + "!")
func restartGame():
	get_tree().reload_current_scene()