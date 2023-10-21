extends Node

@onready var _animation_player = $AnimationPlayer
@onready var _left_post = $MarginContainer/VBoxContainer/HBoxContainerPosts/LeftMarginContainer/LeftPost
@onready var _right_post = $MarginContainer/VBoxContainer/HBoxContainerPosts/RightMarginContainer/RightPost
@onready var _score_label = $MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainer/ScoreLabel
@onready var _fail_attempt_array = [
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail3/Fail3, 
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail2/Fail2, 
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail1/Fail1
]

var score : int = 0
var number_failed_attempts : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_variables() 
	
	# Connect to signals of when player selects the correct post
	assert(_left_post.scored_point.connect(update_score) == OK)
	assert(_right_post.scored_point.connect(update_score) == OK)
	
	# Connect to signals of when player selects the incorrect post
	assert(_left_post.failed_attempt.connect(update_fail_attempts) == OK)
	assert(_right_post.failed_attempt.connect(update_fail_attempts) == OK)
	
	_score_label.text = Util.STR_SCORE + str(score)
	assign_random_images_to_posts()
	
	# Assign each their own animation for hovering
#	_left_post.assign_animation(Util.ANIM_LEFT_START_HOVERING, Util.ANIM_LEFT_STOP_HOVERING)
#	_right_post.assign_animation(Util.ANIM_RIGHT_START_HOVERING, Util.ANIM_RIGHT_STOP_HOVERING)


func assign_random_images_to_posts() -> void:
	# 50-50% random chance of the posts being true or false, so it doesn't get predictable
	# Remember that when one is true, the other has to be false!
	
	# Create a random number between 0 and 1
	var chance_true_or_fake = randf()
	
	# If the number was bigger than 0.5, the left post will be false and the right will be true
	if (chance_true_or_fake > 0.5):
		# Let's dissect this: 
		# Each post has a function called assing_image, which we are calling and passing arguments to
		# These arguments are: one image and a boolean (true or false) 
		# To send the image we are simply generating a random index between 0 and the size of the array
		# And with array.pop_at(index), the image at that index is returned and removed from the array
		# So it won't appear again!
		_left_post.assign_image(Util.FAKE_POST_ARRAY.pop_at(randi() % Util.FAKE_POST_ARRAY.size()), false)
		_right_post.assign_image(Util.TRUE_POST_ARRAY.pop_at(randi() % Util.TRUE_POST_ARRAY.size()), true)
	
	# And vice-versa
	else:
		_left_post.assign_image(Util.TRUE_POST_ARRAY.pop_at(randi() % Util.TRUE_POST_ARRAY.size()), true)
		_right_post.assign_image(Util.FAKE_POST_ARRAY.pop_at(randi() % Util.FAKE_POST_ARRAY.size()), false)


func update_score() -> void:
	# If the player answered correctly, increase the score by one point
	score += 1
	
	# Update the text to show this new, increased score
	_score_label.text = Util.STR_SCORE + str(score)
	
	verify_win_or_loss()



func update_fail_attempts() -> void:
	# Make the red balls visible, to show the player if they have 1, 2 or 3 failed attempts
	_animation_player.play(Util.ANIM_FAIL_ARRAY[number_failed_attempts])
	await _animation_player.animation_finished
	
	number_failed_attempts += 1 
	verify_win_or_loss()


func verify_win_or_loss() -> void:
	if number_failed_attempts == 2:
		# If the player has reached 3 failed attempts
			# number_failed_attempts started at 0, so when number_failed_attempts = 2, 
			# the player has already failed a total of 3 times, so they lose!
		# GAME OVER - PLAYER WINS
		Util.player_has_won = false
		Util.player_score = score
		get_tree().change_scene_to_file(Util.END_SCENE)
		
	elif Util.FAKE_POST_ARRAY.is_empty() or Util.TRUE_POST_ARRAY.is_empty():
		# If the player has seen all images 
			# Because each time an image is selected, it is removed, when the arrays are empty
			# It means that the player has gone through all images available
		# GAME OVER - PLAYER LOSES
		Util.player_has_won = true
		Util.player_score = score
		get_tree().change_scene_to_file(Util.END_SCENE)
	
	else:
		# Continue game and update the images to start a new round of guessing which post is true
		assign_random_images_to_posts()

	
func reset_variables() -> void: 
	# Place images back in the arrays
	Util.reset_arrays()
	
	# If the player re-enters the game after losing/winning, all variables have to be reset
	score = 0
	number_failed_attempts = 0
	
	# And failed attempts go back to being invisible
	for attempt in _fail_attempt_array:
		attempt.visible = false
