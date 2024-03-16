class Player:
	def __init__(self, name, privilege=True):
			self.name = name
			self.privilege = privilege

def tit_for_tat(player, your_previous_action, other_previous_action):
	if your_previous_action == "cooperate" and other_previous_action == "cooperate":
			return "cooperate"
	elif your_previous_action == "defect" and other_previous_action == "cooperate":
			return "defect"
	elif your_previous_action == "cooperate" and other_previous_action == "defect":
			return "defect"
	elif your_previous_action == "defect" and other_previous_action == "defect":
			# Lose privilege if defecting
			player.privilege = False
			return "defect"
	else:
			return "Invalid actions"

# Example usage:
player_A = Player("Player A")
player_B = Player("Player B")

# Player A's previous action is cooperate, Player B's previous action is defect
action_A = tit_for_tat(player_A, "cooperate", "defect")
action_B = tit_for_tat(player_B, "defect", "cooperate")

print("Player A's action:", action_A)  # Output: "defect"
print("Player A's privilege:", player_A.privilege)  # Output: False
print("Player B's action:", action_B)  # Output: "defect"
print("Player B's privilege:", player_B.privilege)  # Output: True
