extends CharacterBody2D

@export var speed: float = 500.0
var dir: Vector2
var winner: bool = false


func _ready() -> void:
	dir = random_dir()

func _process(delta: float) -> void:
	if !winner:
		var collision: KinematicCollision2D = move_and_collide(dir * speed * delta)

		if collision:
			dir = dir.bounce(collision.get_normal())

func random_dir() -> Vector2:
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)

	return new_dir.normalized()

func winner_found() -> void:
	winner = true

