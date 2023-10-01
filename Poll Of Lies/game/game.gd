extends Node

@onready var _left_post = $MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/LeftPost
@onready var _right_post = $MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/RightPost

# Called when the node enters the scene tree for the first time.
func _ready():
	assign_random_images_to_posts()


func assign_random_images_to_posts():
	# 50-50% chance of the posts being true or false 
	# Remember that when one is true, the other has to be false!
	var chance_true_or_fake = randf()
	if (chance_true_or_fake > 0.5):
		_left_post.assign_image(Util.FAKE_POST_ARRAY[randi() % Util.FAKE_POST_ARRAY.size()], false)
		_right_post.assign_image(Util.TRUE_POST_ARRAY[randi() % Util.TRUE_POST_ARRAY.size()], true)
	else:
		_left_post.assign_image(Util.TRUE_POST_ARRAY[randi() % Util.TRUE_POST_ARRAY.size()], true)
		_right_post.assign_image(Util.FAKE_POST_ARRAY[randi() % Util.FAKE_POST_ARRAY.size()], false)


func _input(event):
	if event is InputEventMouseButton && event.is_action_released("mouse_click"):
		assign_random_images_to_posts()
