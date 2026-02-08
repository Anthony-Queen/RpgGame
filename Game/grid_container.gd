extends GridContainer

var variable = "Stringa"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = variable
	add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
