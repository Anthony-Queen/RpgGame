extends Control

@onready var enemy = Globals.current_enemy
@onready var enemy_node = Globals.current_enemy_node

var CurrentTurn
# TEST
var current: Array = [enemy_node, Player]
var x = randi() % 2
# TESTEND
signal PlayerTurn
signal EnemyTurn

func _ready():
	pass

func _process(delta):
	if Globals.current_enemy_node != null and has_node("Panel/HP") and has_node("Enemy/EnemySprite"):
		updateHp()
# Setup enemy sprite
		$Enemy/EnemySprite.sprite_frames = Globals.current_enemy.Sprite
		$Enemy/EnemySprite.play("default")
		
		# Connect signals
		Globals.current_enemy_node.enemy_attack.connect(_on_enemy_attack)
		Globals.current_enemy_node.enemy_defend.connect(_on_enemy_defend)
		Globals.current_enemy_node.enemy_heal.connect(_on_enemy_heal)
		
		$Player/Camera2D.enabled = false
		
		# Stop running
		set_process(false)

func ChangeTurn(current):
	CurrentTurn = current
	if current == Player:
		PlayerTurn.emit()
		print("Player is playing")
	else:
		EnemyTurn.emit()
		print("Enemy is playing")

func _on_enemy_attack():
	print("enemy atatcked")
	Globals.current_hp -= enemy.Damage
	updateHp()
	ChangeTurn(Player)

func _on_enemy_defend():
	print("Enemy defended")
	#Gotta figure out how to reduce player dmg by %
	ChangeTurn(Player)

func _on_enemy_heal():
	print("Enemy healed")
	enemy.Health += 10
	print(enemy.Health)
	ChangeTurn(Player)

func updateHp():
	Globals.current_hp -= 0.01 # Fixes a bug that makes HpBar go to 0 (Idek why this happens tbh, but doing this fixes it.)
	$Panel/HP.update_bar(
			Globals.current_hp,
			Globals.max_hp
		)

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
