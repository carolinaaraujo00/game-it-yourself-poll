extends TextureRect

signal scored_point
signal failed_attempt

var _is_post_true : bool
var _mouse_hovering : bool

func _ready() -> void:
	# Connect self to mouse entered and exited signals 
	assert(mouse_entered.connect(_on_mouse_entered) == OK)
	assert(mouse_exited.connect(_on_mouse_exited) == OK)

# Method that receives a Texture2D and a boolean 
# The Texture2D is the image that is going to be placed in this post
# The boolean tells the post if it is true or false
func assign_image(new_texture : Texture2D, new_bool : bool) -> void:
	texture = new_texture
	_is_post_true = new_bool


func _input(event) -> void:
	# If player clicks on the correct answer
	if (event is InputEventMouseButton && event.is_action_released("mouse_click") && _mouse_hovering):
		# Play click audio
		SoundManager.instance.play_click_sfx()
		
		# If the post is correct, emit a signal to increase the score
		if texture != null:
			if _is_post_true:
				scored_point.emit()
			# Otherwise, emit a signal to show a new failed attempt
			else: 
				failed_attempt.emit()


# SIGNAL HANDLING
func _on_mouse_entered() -> void:
	_mouse_hovering = true

func _on_mouse_exited() -> void:
	_mouse_hovering = false
