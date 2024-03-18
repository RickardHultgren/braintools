class SocialContract:

	def __init__(self, privilege=True):
		self.privilege = privilege


#tit for tat

	def play_round(self, player1_action, player2_action):
		if player1_action == "cooperate" and player2_action == "cooperate":
			return "cooperate", self.privilege
		elif player1_action == "defect" and player2_action == "cooperate":
			self.privilege = False  # Losing privilege due to defection
			return "defect", self.privilege
		elif player1_action == "cooperate" and player2_action == "defect":
			self.privilege = False  # Losing privilege due to opponent's defection
			return "defect", self.privilege
		elif player1_action == "defect" and player2_action == "defect":
			self.privilege = False  # Both parties defect, no privilege maintained
			return "defect", self.privilege
		else:
			return "Invalid actions", self.privilege


def main():
	mode = input(
	    "Enter 'narcissistic' to play in narcissistic mode. Otherwise, press enter: "
	)
	num_players = int(
	    input("Enter the number of players (default is 2): ") or "2")
	num_decision_makers = int(
	    input("Enter the number of decision_makers (default is 2): ") or "2")
	players = [SocialContract() for _ in range(num_players)]
	decision_makers = [SocialContract() for _ in range(num_decision_makers)]
	cooperation = "1"

	task = str(input("What is the purpose of the social contract?"))
	passed = str(input("What constitutes a satisfactory outcome?"))

	previous_result = 0
	current_result = 0
	while True:
		actions = []

		for i, player in enumerate(players):
			if mode == "narcissistic":
				other_player = "Player 1" if i == 1 else f"Player {i+1}"
				print("Task:\n\s" % task)
				print("Expectation:\n\s" % passed)
				action = input(
				    f"{other_player}, did Player {i+1} achieve satisfactory results in the realm of the social contract? (Type '1' for success or '0' for failure): "
				)
			elif i != 1:
				for j, player in enumerate(players):
					print("Task:\n\s" % task)
					print("Expectation:\n\s" % passed)
					action = input(
					    f"Does Player {i+1} believe that Player {j+1} has achieved satisfactory outcomes within the realm of the social contract? (Type '1' for success or '0' for failure): "
					)
			actions.append(action)

		for i, decision_makers in enumerate(decision_makers):
			other_player_action = actions[1] if i == 0 else actions[0]
			action, privilege = player.play_round(actions[i], other_player_action)
			print(
			    f"Player {i+1}, your action for the current round: {action}. Privilege status: {privilege}"
			)

		if any(action != cooperation for action in actions):
			print("At least one player defected. Cooperation not fulfilled.")
			#break

		if all(action == cooperation for action in actions):
			print("All players cooperated! Cooperation fulfilled.")
			print("Player 1, you have a privilege in the social contract.")
			#break


if __name__ == "__main__":
	main()
