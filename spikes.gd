extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$"../Player/HitHurt".play()
		body.game_over()
