def tit_for_tat(your_previous_action, other_previous_action, privilege_lost):
	if your_previous_action == "cooperate" and other_previous_action == "cooperate":
			return "cooperate", "none"
	elif your_previous_action == "defect" and other_previous_action == "cooperate":
			return "defect", privilege_lost
	elif your_previous_action == "cooperate" and other_previous_action == "defect":
			return "defect", privilege_lost
	elif your_previous_action == "defect" and other_previous_action == "defect":
			return "defect", privilege_lost
	else:
			return "Invalid actions", "none"

# Define a relevant temptation bundling object
def reward_task_completion(task):
	if task == "homework":
			return "Watching an episode of your favorite TV show"

# Example usage
your_action = "defect"
other_action = "cooperate"
lost_privilege = reward_task_completion("homework")
print("Your action:", your_action)
print("Opponent's action:", other_action)
print("Lost privilege:", lost_privilege)