extends ProgressBar

@export var player: Player

func ready():
	player.hea

func update():
	value = player.currentHealth * 100/player.maxHealth
