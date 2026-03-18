extends Control

@onready var enemy = Globals.current_enemy
@onready var enemy_node = Globals.current_enemy_node

var CurrentTurn
var current: Array = [Globals.current_enemy_node, Player]
var x = randi() % 2
signal PlayerTurn
signal EnemyTurn

func _ready():
	if Globals.current_enemy_node:
		print("Got signals!")
		Globals.current_enemy_node.enemy_attack.connect(_on_enemy_attack)
		Globals.current_enemy_node.enemy_defend.connect(_on_enemy_defend)
		Globals.current_enemy_node.enemy_heal.connect(_on_enemy_heal)
		
		call_deferred("ChangeTurn", current[0])

func _process(_delta):
	if Globals.current_enemy_node != null and has_node("Panel/HP") and has_node("Enemy/EnemySprite") and has_node("Panel/LevelSystem"): 
		updateHp()
# Setup enemy sprite
		$Enemy/EnemySprite.sprite_frames = Globals.current_enemy.Sprite
		$Enemy/EnemySprite.play("Default")
		$Enemy/EnemySprite.play("default")
		$Player/Camera2D.enabled = false
		
		# Stop running
		set_process(false)

func ChangeTurn(current):
	CurrentTurn = current
	if current == Player:
		PlayerTurn.emit()
		print("Player is playing")
	else:
		current.decide()
		print("Enemy Boutta Act")
		EnemyTurn.emit()

func _on_enemy_attack():
	print("enemy atatcked")
	if Globals.isPlayerDefending == false:
		Globals.current_hp -= enemy.Damage
		Globals.isEnemyDefending = false
		updateHp()
		ChangeTurn(Player)
	else:
		Globals.current_hp -= enemy.Damage * 0.5
		Globals.isEnemyDefending = false
		updateHp()
		ChangeTurn(Player)

func _on_enemy_defend():
	print("Enemy defended")
	Globals.isEnemyDefending = true
	ChangeTurn(Player)

func _on_enemy_heal():
	print("Enemy healed")
	Globals.isEnemyDefending = false
	enemy.Health += 10
	print(enemy.Health)
	ChangeTurn(Player)

func updateHp():
	if has_node("Panel/HP"): # Fixes a bug that makes HpBar go to 0 (Idek why this happens tbh, but doing this fixes it.)
		$Panel/HP.update_bar(
				Globals.current_hp,
				Globals.max_hp
			)

func on_combat_started(_enemy):
	print("Combat started")

func _on_guard_button_pressed() -> void:
	$PanelContainer/GuardPanel/Label.text = "  Guarding"
	ChangeTurn(Globals.current_enemy_node)

# Next Functions are for Showing relevant Panels
func show_panel(name):
	for panel in $PanelContainer.get_children():
		panel.visible = false
	$PanelContainer.get_node(name).visible = true

func _on_attack_pressed() -> void:
	$PanelContainer/AttackPanel.visible = true
	show_panel("AttackPanel")

func _on_guard_pressed() -> void:
	$PanelContainer/GuardPanel.visible = true
	show_panel("GuardPanel")

func _on_item_pressed() -> void:
	show_panel("ItemPanel")

func _on_special_pressed() -> void:
	show_panel("SpecialPanel")
