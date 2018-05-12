extends Node

# 0 - 1000
# randi function returns a random number randi()%11+1

onready var message = $Message
onready var btnCorrect = $Correct


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
	message.text = "is " + str(num) + " your number ?"
func _process(delta):
	if Input.is_action_just_pressed("up"):
		tryGuess("up")
	elif Input.is_action_just_pressed("down"):
		tryGuess("down")
	elif Input.is_action_just_pressed("restart"):
		if (end):
			restartGame()
		else:
			endGame()
func tryGuess(type):
	if type == "up":
		minGuess = num
	else:
		maxGuess = num
	num = (minGuess + maxGuess) / 2
	message.text = "is " + str(num) + " your number ?"
func endGame():
	end = true
	message.text = "Yes! your number was " + str(num) + "!"
func restartGame():
	get_tree().reload_current_scene()

func _on_Less_pressed():
	tryGuess("down")


func _on_Greater_pressed():
	tryGuess("up")


func _on_Correct_pressed():
	if (end):
		btnCorrect.text = "Correct"
		restartGame()
	else:
		btnCorrect.text = "Restart"
		endGame()
