class CognitiveRestructuring:

	def __init__(self):
		self.thoughts = []

	def add_thought(self, thought):
		self.thoughts.append(thought)

	def challenge_thoughts(self):
		for i, thought in enumerate(self.thoughts):
			print(f"Thought {i + 1}: {thought}")
			response = input("Is this thought accurate or helpful? (yes/no): ")
			if response.lower() == "no":
				new_thought = input(
				    "What is a more balanced and realistic way to think about this?: ")
				self.thoughts[i] = new_thought
				print(f"Updated thought {i + 1}: {new_thought}")
			else:
				print("This thought is accurate and helpful.")


def main():
	cognitive_restructuring = CognitiveRestructuring()

	print("Welcome to Cognitive Restructuring Exercise.")
	print("Please enter your thoughts. Type 'done' when finished.")

	while True:
		thought = input("Enter your thought: ")
		if thought.lower() == "done":
			break
		cognitive_restructuring.add_thought(thought)

	print("\nNow, let's challenge and restructure your thoughts:\n")
	cognitive_restructuring.challenge_thoughts()


if __name__ == "__main__":
	main()
