extends Control

var player  # will be assigned from Main

func init(_player):
	player = _player
	player.combat_started.connect(on_combat_started)  # safe now
	hide()
	$Panel/UI.hide()

func show_panel(name):
	for panel in $PanelContainer.get_children():
		panel.visible = false
	$PanelContainer.get_node(name).visible = true

func on_combat_started(enemy):
	show()
	$Panel/UI.show()
	#$Camera2D.make_current()
	print("Combat started")

func _on_attack_pressed() -> void:
	show_panel("AttackPanel")

func _on_guard_pressed() -> void:
	show_panel("GuardPanel")

func _on_item_pressed() -> void:
	show_panel("ItemPanel")

func _on_special_pressed() -> void:
	show_panel("SpecialPanel")
