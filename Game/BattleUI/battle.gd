extends Control
var player
var enemy

func _ready():
	var enemy = GameState.current_enemy
	$AnimatedSprite2D.sprite_frames = enemy.Sprite
	$AnimatedSprite2D.play("default")

func init(_player):
	player = _player
	player.combat_started.connect(on_combat_started)

func show_panel(name):
	for panel in $PanelContainer.get_children():
		panel.visible = false
	$PanelContainer.get_node(name).visible = true

func on_combat_started(enemy):
	print("Combat started")

func _on_attack_pressed() -> void:
	show_panel("AttackPanel")

func _on_guard_pressed() -> void:
	show_panel("GuardPanel")

func _on_item_pressed() -> void:
	show_panel("ItemPanel")

func _on_special_pressed() -> void:
	show_panel("SpecialPanel")
