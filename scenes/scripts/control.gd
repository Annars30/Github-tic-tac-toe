extends Control

const CELL_X = "X"
const CELL_O = "O"
var CELL_EMPTY = ""

@onready var buttons = $GridContainer.get_children()
@onready var click_sound = $Click_sound
@onready var restart_sound = $restart_sound

var current_player

func _ready():
	var button_index = 0
	for button in buttons:
		button.connect("pressed" , _on_button_click.bind(button_index, button))
		button_index += 1
	reset_game()
		
func _on_button_click(idx, button):
	button.text = current_player
	current_player = CELL_X if current_player == CELL_O else CELL_O
	button.disabled = true
	click_sound.play()
	
func reset_game():
	current_player = CELL_X
	
	
func _physics_process(delta: float):
	if Input.is_action_just_pressed("restart"):
		restart_sound.play()
		await get_tree().create_timer(0.1).timeout
		get_tree().reload_current_scene()
		
