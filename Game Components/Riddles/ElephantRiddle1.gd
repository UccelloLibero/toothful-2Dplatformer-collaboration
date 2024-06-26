# ElephantRiddle1.gd
extends Area2D

@onready var riddle_display = $ColorRect
@onready var label_text = $ColorRect/Label
@onready var button_correct = $ColorRect/Button
@onready var button_option1 = $ColorRect/Button2
@onready var button_option2 = $ColorRect/Button3
@onready var timer = $Timer

# Correct answer index
@export var correct_answer = 2

# Variable to store reference to the player
var player = null

# Hide riddle on start
func _ready():
	riddle_display.visible = false
	label_text.visible = false
	button_correct.visible = false
	button_option1.visible = false
	button_option2.visible = false

# When player enters the collision boundry
func _on_body_entered(body):
	if body.name == "Player":
		player = body
		player.can_move = false
		riddle_display.visible = true
		label_text.visible = true
		button_correct.visible = true
		button_option1.visible = true
		button_option2.visible = true
	
# You can choose which ever button you want to be correct 
# Just make sure it includes the logic from the first button connected below
# Connect buttons in Node > pressed() > Connect > Connect to script
# Remeber to test and customize the layout of the text in the ColorRect
		
func _on_button_pressed():
	label_text.text = "That is incorrect. Try Again."

func _on_button_2_pressed():
	label_text.text = "Correct!"
	timer.start(5)
	await timer.timeout
	# Enable player movement
	if player != null:
		player.can_move = true
	player = null
	queue_free()
	queue_free()
	
func _on_button_3_pressed():
	label_text.text = "That is incorrect. Try Again."
	
func _on_button_4_pressed():
	label_text.text = "That is incorrect. Try Again."

func _on_timer_timeout():
	riddle_display.visible = false
	label_text.visible = false
	button_correct.visible = false
	button_option1.visible = false
	button_option2.visible = false


