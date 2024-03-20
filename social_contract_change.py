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

		elif mode == "leader":
			print("Reflecting on the task and its outcomes...")
			print("Task of the other person:", task)
			print("Expectation of the other person:", passed_task)
			response_cycle = input(
			    "Where in the story cycle is the other person? (1. awakening, 2. quest, 3. resolution): "
			)
			response_construction = input(
			    "What is the challenge about? (1. norm-break, 2. existential/identity-break, 3. pattern/puzzle): "
			)
			if response_cycle == 1 and response_construction == 1:
				print(
				    "Make a joke with paired phrases structure showing transparency (is used when hopeful about something) (... is like...)."
				)
			elif response_cycle == 1 and response_construction == 2:
				print(
				    "Make an ironic joke about how insignificance one is alone in the group."
				)
			elif response_cycle == 1 and response_construction == 3:
				print(
				    "Surprise by a simple-truth joke (introduce a personal connection to a mundane situation)"
				)
			elif response_cycle == 2 and response_construction == 1:
				print(
				    "discover new perspectives (clarity in pitching) with reverse jokes."
				)
			elif response_cycle == 2 and response_construction == 2:
				print(
				    "Make a joke about compliance with a compare and contrast structure."
				)
			elif response_cycle == 2 and response_construction == 3:
				print("Show options by making an incongruent joke.")
			elif response_cycle == 3 and response_construction == 1:
				print(
				    "Show how to tolerate and accept with a superior joke structure (used when showing authority in pitching)."
				)
			elif response_cycle == 3 and response_construction == 2:
				print("Make a joke paradox joke about the new situation.")
			elif response_cycle == 3 and response_construction == 3:
				print(
				    "Show the signiture of a person by a joke with the structure observation and recognition."
				)

			new_task = input("Enter a more balanced perspective on the task: ")
			new_passed_task = input(
			    "Enter a revised expectation for the task outcome: ")
			return new_task, new_passed_task

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
	    "Enter 'narcissistic' to play in narcissistic mode. Enter 'leader' to play in leader role (managing others' thougts). Otherwise, press enter: "
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
