class Player:
	def __init__(self):
			self.has_opportunity = True

	def tit_for_tat(self, your_previous_action, other_previous_action):
			if your_previous_action == "cooperate" and other_previous_action == "cooperate":
					return "cooperate"
			elif your_previous_action == "defect" and other_previous_action == "cooperate":
					self.has_opportunity = False  # Lose the opportunity if defecting
					return "defect"
			elif your_previous_action == "cooperate" and other_previous_action == "defect":
					return "defect"
			elif your_previous_action == "defect" and other_previous_action == "defect":
					return "defect"
			else:
					return "Invalid actions"

	def get_opportunity_status(self):
			return self.has_opportunity

	def use_opportunity(self):
			if self.has_opportunity:
					# Perform task or enjoy the reward associated with the opportunity
					print("Using the opportunity...")
					self.has_opportunity = False
			else:
					print("No opportunity available.")

# Example usage:
player1 = Player()
player2 = Player()

# Assume player1 cooperated in the previous round and player2 defected
# Player1 decides to use the opportunity or perform the task associated with it
if player1.tit_for_tat("cooperate", "defect") == "cooperate":
	print("Player1 cooperates.")
	if player1.get_opportunity_status():
			player1.use_opportunity()
	else:
			print("Player1 lost the opportunity.")
else:
	print("Player1 defects.")
	if player1.get_opportunity_status():
			player1.use_opportunity()
	else:
			print("Player1 lost the opportunity.")
