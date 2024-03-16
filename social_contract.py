class TitForTatPlayer:
	def __init__(self):
			self.privilege_available = True

	def cooperate_or_defect(self, other_previous_action):
			if other_previous_action == "defect":
					self.privilege_available = False
					return "defect"
			elif other_previous_action == "cooperate" and self.privilege_available:
					return "cooperate"
			else:
					return "defect"


# Example usage:
player = TitForTatPlayer()

# Cooperate initially
your_action = player.cooperate_or_defect("cooperate")
print("Your action:", your_action)  # Output: cooperate

# Opponent cooperates
your_action = player.cooperate_or_defect("cooperate")
print("Your action:", your_action)  # Output: cooperate

# Opponent defects
your_action = player.cooperate_or_defect("defect")
print("Your action:", your_action)  # Output: defect

# Subsequent rounds after privilege is lost
your_action = player.cooperate_or_defect("cooperate")
print("Your action:", your_action)  # Output: defect
