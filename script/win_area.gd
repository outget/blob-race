extends Area2D

signal won

@export var restart_timer: Timer
@export var winner_label: Label


func _ready() -> void:
	winner_label.text = ""

func _on_body_entered(body: Node2D) -> void:
	winner_label.text = "winner is " + body.name
	won.emit()
	restart_timer.start(0.5)
