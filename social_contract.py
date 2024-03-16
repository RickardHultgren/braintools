def tit_for_tat(player1_action, player2_action, privilege_lost=False):
	if player1_action == "cooperate" and player2_action == "cooperate":
			return "cooperate", privilege_lost
	elif player1_action == "defect" and player2_action == "cooperate":
			return "defect", True  # Player1 defects, losing the privilege
	elif player1_action == "cooperate" and player2_action == "defect":
			return "defect", False  # Player2 defects, no privilege lost
	elif player1_action == "defect" and player2_action == "defect":
			return "defect", False  # Both players defect, no privilege lost
	else:
			return "Invalid actions", privilege_lost

# Example usage:
player1_input = input("Player 1's action (cooperate/defect): ").lower()
player2_input = input("Player 2's action (cooperate/defect): ").lower()

result, privilege_lost = tit_for_tat(player1_input, player2_input)

if result == "Invalid actions":
	print("Invalid actions were provided.")
else:
	print(f"Player 1's action: {result}")
	if privilege_lost:
			print("Player 1 lost the privilege in the social contract due to defection.")
	else:
			print("Player 1 maintained the privilege in the social contract.")
