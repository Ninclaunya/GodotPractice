extends Button

@export var player: Player
@export var heal_amount := 20

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	print('button pressed')
	if player:
		player.heal(heal_amount)
