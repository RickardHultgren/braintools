class SocialContract:

	def __init__(self, privilege=True):
		self.privilege = privilege

	# Tit for Tat

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
	players = [SocialContract() for _ in range(num_players)]
	cooperation = "1"

	task = input("What is the purpose of the social contract?")
	passed = input("What constitutes a satisfactory outcome?")

	while True:
		actions = []
		if mode == "narcissistic":
			task = input(
			    f"The task is: {task} \nDo you want to redefine the task? Then write the new task of the social contract. Otherwise, press enter: "
			) or task
			passed = input(
			    f"A satisfactory outcome is: {passed} \nDo you want to redefine that? Then write the new definition. Otherwise, press enter: "
			) or passed
		else:
			task = input(
			    f"The task is: {task} \nCheck with the other players if they want to change the task. Otherwise, press enter: "
			) or task
			passed = input(
			    f"A satisfactory outcome is: {passed} \nCheck if the other players want to redefine that? Then write the new definition. Otherwise, press enter: "
			) or passed
		for i, player in enumerate(players):
			if mode == "narcissistic":
				other_player = "Player 1" if i == 1 else f"Player {i+1}"
				print("Task:\n%s" % task)
				print("Expectation:\n%s" % passed)
				action = input(
				    f"{other_player}, did Player {i+1} achieve satisfactory results in the realm of the social contract? (Type '1' for success or '0' for failure): "
				)
			elif i != 1:
				for j, player in enumerate(players):
					print("Task:\n%s" % task)
					print("Expectation:\n%s" % passed)
					action = input(
					    f"Does Player {i+1} believe that Player {j+1} has achieved satisfactory outcomes within the realm of the social contract? (Type '1' for success or '0' for failure): "
					)
			actions.append(action)

		for i, player in enumerate(players):
			other_player_action = actions[1] if i == 0 else actions[0]
			action, privilege = player.play_round(actions[i], other_player_action)
			print(
			    f"Player {i+1}, your action for the current round: {action}. Privilege status: {privilege}"
			)

		if any(action != cooperation for action in actions):
			print("At least one player defected. Cooperation not fulfilled.")
			# break

		if all(action == cooperation for action in actions):
			print("All players cooperated! Cooperation fulfilled.")
			print("Player 1, you have a privilege in the social contract.")
			# break


if __name__ == "__main__":
	main()
