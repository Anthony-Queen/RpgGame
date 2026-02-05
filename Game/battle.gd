extends Control

func _ready():
	var player = get_node("../Player")
	player.combat_started.connect(on_combat_started)
	hide()


func show_panel(name):
	for panel in $PanelContainer.get_children():
		panel.visible = false
	$PanelContainer.get_node(name).visible = true

func on_combat_started(enemy):
	show()
	print("Combat started")

# Shows Panels when you press their correspective button >Mrrrow<
func _on_attack_pressed() -> void:
	show_panel("AttackPanel")

func _on_guard_pressed() -> void:
	show_panel("GuardPanel")

func _on_item_pressed() -> void:
	show_panel("ItemPanel")

func _on_special_pressed() -> void:
	show_panel("SpecialPanel")
