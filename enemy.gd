extends StaticBody2D

class_name Enemy

@export var damage := 10

signal healthChanged

@export var click_damage := 10
@export var maxHealth := 50
@onready var currentHealth := maxHealth

var isHurt := false
var can_damage := true

func _ready() -> void:
	currentHealth = maxHealth
	input_event.connect(_on_input_event)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		take_damage(click_damage)
		

func take_damage(amount):
	currentHealth -= amount
	isHurt = true
	healthChanged.emit()
	isHurt = false
	if currentHealth <= 0:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Die.dialogue"), "start")

func deal_damage(player):
	if can_damage:
		player.hurt(self)
		can_damage = false
		$"../TakeDamage".start()

func _on_take_damage_timeout() -> void:
	
	can_damage = true
	
