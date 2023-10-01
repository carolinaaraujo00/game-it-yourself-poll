extends Node

@onready var _left_post = $MarginContainer/VBoxContainer/HBoxContainer/LeftMarginContainer/LeftPost
@onready var _right_post = $MarginContainer/VBoxContainer/HBoxContainer/RightMarginContainer/RightPost
@onready var _score_label = $MarginContainer/VBoxContainer/MarginContainer/ScoreLabel

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(_left_post.score_point.connect(update_score) == OK)
	assert(_right_post.score_point.connect(update_score) == OK)
	
	_score_label.text = Util.STR_SCORE + str(score)
	assign_random_images_to_posts()
	
	# Assign each their own animation for hovering
	_left_post.assign_animation(Util.ANIM_LEFT_START_HOVERING, Util.ANIM_LEFT_STOP_HOVERING)
	_right_post.assign_animation(Util.ANIM_RIGHT_START_HOVERING, Util.ANIM_RIGHT_STOP_HOVERING)


func assign_random_images_to_posts() -> void:
	# 50-50% chance of the posts being true or false 
	# Remember that when one is true, the other has to be false!
	var chance_true_or_fake = randf()
	if (chance_true_or_fake > 0.5):
		_left_post.assign_image(Util.FAKE_POST_ARRAY[randi() % Util.FAKE_POST_ARRAY.size()], false)
		_right_post.assign_image(Util.TRUE_POST_ARRAY[randi() % Util.TRUE_POST_ARRAY.size()], true)
	else:
		_left_post.assign_image(Util.TRUE_POST_ARRAY[randi() % Util.TRUE_POST_ARRAY.size()], true)
		_right_post.assign_image(Util.FAKE_POST_ARRAY[randi() % Util.FAKE_POST_ARRAY.size()], false)


func update_score() -> void:
	score += 1
	_score_label.text = Util.STR_SCORE + str(score)
	
	assign_random_images_to_posts()
