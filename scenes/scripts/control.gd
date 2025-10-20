extends Control

const CELL_EMPTY = ""
const CELL_X = "X"
const CELL_O = "O"


@onready var buttons = $GridContainer.get_children()

var current_player
var board

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

func reset_game():
	current_player = CELL_X
