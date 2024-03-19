class SocialContract:

	def __init__(self, has_privilege=True):
		self.has_privilege = has_privilege

	def cognitive_restructuring(self, task, passed_task, mode):
		if mode == "narcissistic":
			print("Reflecting on the task and its outcomes...")
			print("Task:", task)
			print("Expectation:", passed_task)
			response = input(
			    "Do you feel that your perception of the task or its outcomes needs adjustment? (yes/no): "
			)
			if response.lower() == "yes":
				new_task = input("Enter a more balanced perspective on the task: ")
				new_passed_task = input(
				    "Enter a revised expectation for the task outcome: ")
				return new_task, new_passed_task
			else:
				print(
				    "No adjustments needed. Proceeding with current task and expectations."
				)
				return task, passed_task
		else:
			print("Reflecting on the task and its outcomes with other players...")
			print("Task:", task)
			print("Expectation:", passed_task)
			response = input(
			    "Do you and other players agree on the perception of the task and its outcomes? (yes/no): "
			)
			if response.lower() == "no":
				new_task = input("Enter a revised task agreed upon by all players: ")
				new_passed_task = input(
				    "Enter a revised expectation agreed upon by all players: ")
				return new_task, new_passed_task
			else:
				print(
				    "Consensus reached. Proceeding with current task and expectations."
				)
				return task, passed_task

	def play_round(self, player1_action, player2_action):
		cooperation = "1"
		if player1_action == "cooperate" and player2_action == "cooperate":
			return "cooperate", self.has_privilege
		elif player1_action == "defect" and player2_action == "cooperate":
			self.has_privilege = False  # Losing privilege due to defection
			return "defect", self.has_privilege
		elif player1_action == "cooperate" and player2_action == "defect":
			self.has_privilege = False  # Losing privilege due to opponent's defection
			return "defect", self.has_privilege
		elif player1_action == "defect" and player2_action == "defect":
			self.has_privilege = False  # Both parties defect, no privilege maintained
			return "defect", self.has_privilege
		else:
			return "Invalid actions", self.has_privilege


def main():
	mode = input(
	    "Enter 'narcissistic' to play in narcissistic mode. Otherwise, press enter: "
	)
	num_players = int(
	    input("Enter the number of players (default is 2): ") or "2")
	players = [SocialContract() for _ in range(num_players)]
	cooperation = "1"
	need = input("What need should the task meet?")
	abilities = input("What abilities do the players have?")
	contracts = input("What other contracts frame the task?")
	task = input(
	    f"In order to meet the need of {need} with the abilities of {abilities} within the scope of already existing social norms ({contracts}), what task must be done? "
	)
	passed_task = input(
	    "What constitutes a satisfactory outcome from this task for you? ")
	while True:
		actions = []
		task, passed_task = players[0].cognitive_restructuring(
		    task, passed_task, mode)
		for i, player in enumerate(players):
			other_player = "Player 1" if i == 1 else f"Player {i+1}"
			print("Task:\n%s" % task)
			print("Expectation:\n%s" % passed_task)
			action = input(
			    f"{other_player}, did Player {i+1} achieve satisfactory results within the realm of the social contract? (Type '1' for success or '0' for failure): "
			)
			actions.append(action)

		for i, player in enumerate(players):
			other_player_action = actions[1] if i == 0 else actions[0]
			action, has_privilege = player.play_round(actions[i],
			                                          other_player_action)
			print(
			    f"Player {i+1}, your action for the current round: {action}. Privilege status: {has_privilege}"
			)

		if any(action != cooperation for action in actions):
			print("At least one player defected. Cooperation not fulfilled.")
			print(
			    "Reflect on the status of the group and the status of the action object."
			)
			# break

		if all(action == cooperation for action in actions):
			print("All players cooperated! Cooperation fulfilled.")
			print("Player 1, you have a privilege in the social contract.")
			print(
			    "Reflect on the status of the group and the status of the action object."
			)
			# break


if __name__ == "__main__":
	main()
