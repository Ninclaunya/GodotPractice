extends ProgressBar

@export var enemy: Enemy

func _ready() -> void:
	enemy.healthChanged.connect(update)
	update()
	
func update():
	value = enemy.currentHealth * 100.0 /enemy.maxHealth
