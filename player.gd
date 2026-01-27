extends CharacterBody2D

class_name Player

signal healthChanged

@export var speed := 500
@export var maxHealth := 100
@onready var currentHealth := maxHealth

var isHurt := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		if body.has_method("deal_damage"):
			body.deal_damage(self)

func hurt(area):
	currentHealth -= 10
	if currentHealth < 0:
		currentHealth = maxHealth
	
	isHurt = true
	healthChanged.emit()
	isHurt = false

func heal(amount):
	currentHealth += amount
	if currentHealth < 0:
		currentHealth = maxHealth
	
	healthChanged.emit()


func _on_pressed() -> void:
	pass # Replace with function body.
