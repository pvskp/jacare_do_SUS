extends Area2D
var look = null

var speed = 500
func _physics_process(delta):
	position += transform.x * speed * delta
	pass
	
func _on_vacina_body_entered(body):
	if body.is_in_group("trash_can") or body.is_in_group("virus"):
		queue_free()
	pass # Replace with function body.

