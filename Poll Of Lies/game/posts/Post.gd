extends TextureRect

signal score_point

var _animation_start_hovering : String 
var _animation_stop_hovering : String
var _is_post_true : bool
var _mouse_hovering : bool

@onready var _animation_player : AnimationPlayer = $"../../../../../AnimationPlayer"

func _ready() -> void:
	# Connect self to mouse entered and exited signals 
	assert(mouse_entered.connect(_on_mouse_entered) == OK)
	assert(mouse_exited.connect(_on_mouse_exited) == OK)


func assign_image(new_texture : Texture2D, new_bool : bool) -> void:
	texture = new_texture
	_is_post_true = new_bool


func assign_animation(anim_start : String, anim_stop : String) -> void: 
	_animation_start_hovering = anim_start
	_animation_stop_hovering = anim_stop


func _input(event) -> void:
	# If player clicks on the correct answer
	if (event is InputEventMouseButton && event.is_action_released("mouse_click") 
		&& _mouse_hovering && _is_post_true):
		
		score_point.emit()


# SIGNAL HANDLING
func _on_mouse_entered() -> void:
	_mouse_hovering = true
	_animation_player.play(_animation_start_hovering)

func _on_mouse_exited() -> void:
	_mouse_hovering = false
	_animation_player.play(_animation_stop_hovering)
