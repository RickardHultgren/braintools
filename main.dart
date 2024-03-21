import 'package:flutter/material.dart';

void main() {
	runApp(SocialContractApp());
}

int passed = 0; // Global integer
String taskObjectStatus = ''; // Global string
String taskEnforcerStatus = ''; // Global string
String groupStatus = ''; // Global string

class SocialContract {
	bool hasPrivilege;

	SocialContract({this.hasPrivilege = true});

	Future<List<dynamic>> cognitiveRestructuring(
			BuildContext context, String task, String passedTask, String mode) async {
		String newTask = task;
		String newPassedTask = passedTask;
		int? storyCycle;
		int? challenge;

		await showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					backgroundColor: Colors.grey[900],
					title: Text(
						'Reflecting on the task and its outcomes...',
						style: TextStyle(color: Colors.cyan),
					),
					content: SingleChildScrollView(
						child: StatefulBuilder(
							builder: (BuildContext context, setState) {
								return Column(
									mainAxisSize: MainAxisSize.min,
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										TextFormField(
											style: TextStyle(color: Colors.cyan),
											initialValue: task,
											onChanged: (value) {
												newTask = value;
											},
											decoration: InputDecoration(
												labelText: 'Task',
												labelStyle: TextStyle(color: Colors.cyan),
												enabledBorder: UnderlineInputBorder(
													borderSide: BorderSide(color: Colors.cyan),
												),
											),
										),
										TextFormField(
											style: TextStyle(color: Colors.cyan),
											initialValue: passedTask,
											onChanged: (value) {
												newPassedTask = value;
											},
											decoration: InputDecoration(
												labelText: 'Expectation',
												labelStyle: TextStyle(color: Colors.cyan),
												enabledBorder: UnderlineInputBorder(
													borderSide: BorderSide(color: Colors.cyan),
												),
											),
										),
										Text(
											'Where in the story cycle is the other person?',
											style: TextStyle(color: Colors.cyan),
										),
										Column(
											children: [
												RadioListTile(
													title: Text('Awakening'),
													value: 1,
													groupValue: storyCycle,
													onChanged: (int? value) {
														setState(() {
															storyCycle = value;
														});
													},
												),
												RadioListTile(
													title: Text('Quest'),
													value: 2,
													groupValue: storyCycle,
													onChanged: (int? value) {
														setState(() {
															storyCycle = value;
														});
													},
												),
												RadioListTile(
													title: Text('Resolution'),
													value: 3,
													groupValue: storyCycle,
													onChanged: (int? value) {
														setState(() {
															storyCycle = value;
														});
													},
												),
											],
										),
										Text(
											'What is the challenge about?',
											style: TextStyle(color: Colors.cyan),
										),
										Column(
											children: [
												RadioListTile(
													title: Text('Norm-break'),
													value: 1,
													groupValue: challenge,
													onChanged: (int? value) {
														setState(() {
															challenge = value;
														});
													},
												),
												RadioListTile(
													title: Text('Existential/Identity-break'),
													value: 2,
													groupValue: challenge,
													onChanged: (int? value) {
														setState(() {
															challenge = value;
														});
													},
												),
												RadioListTile(
													title: Text('Pattern/Puzzle'),
													value: 3,
													groupValue: challenge,
													onChanged: (int? value) {
														setState(() {
															challenge = value;
														});
													},
												),
											],
										),
										ElevatedButton(
											onPressed: () async {
												Navigator.of(context).pop(
														[newTask, newPassedTask, storyCycle, challenge]);
											},
											child: Text('OK', style: TextStyle(color: Colors.cyan)),
										),
									],
								);
							},
						),
					),
				);
			},
		);

		return [newTask, newPassedTask, storyCycle, challenge];
	}

	List<dynamic> playRound(String player1Action, String player2Action) {
		String cooperation = "1";
		if (player1Action == "cooperate" && player2Action == "cooperate") {
			return ["cooperate", hasPrivilege];
		} else if (player1Action == "defect" && player2Action == "cooperate") {
			hasPrivilege = false;
			return ["defect", hasPrivilege];
		} else if (player1Action == "cooperate" && player2Action == "defect") {
			hasPrivilege = false;
			return ["defect", hasPrivilege];
		} else if (player1Action == "defect" && player2Action == "defect") {
			hasPrivilege = false;
			return ["defect", hasPrivilege];
		} else {
			return ["Invalid actions", hasPrivilege];
		}
	}

	Future<void> showJokeSuggestionPopup(
			BuildContext context, int? storyCycle, int? challenge) async {
		String jokeSuggestion = '';

		if (storyCycle == 1 && challenge == 1) {
			jokeSuggestion =
					"Make a joke with paired phrases structure showing transparency (is used when hopeful about something).";
		} else if (storyCycle == 1 && challenge == 2) {
			jokeSuggestion =
					"Make an ironic joke about how insignificant one is alone in the group.";
		} else if (storyCycle == 1 && challenge == 3) {
			jokeSuggestion =
					"Surprise by a simple-truth joke (introduce a personal connection to a mundane situation)";
		} else if (storyCycle == 2 && challenge == 1) {
			jokeSuggestion =
					"Discover new perspectives (clarity in pitching) with reverse jokes.";
		} else if (storyCycle == 2 && challenge == 2) {
			jokeSuggestion =
					"Make a joke about compliance with a compare and contrast structure.";
		} else if (storyCycle == 2 && challenge == 3) {
			jokeSuggestion = "Show options by making an incongruent joke.";
		} else if (storyCycle == 3 && challenge == 1) {
			jokeSuggestion =
					"Show how to tolerate and accept with a superior joke structure (used when showing authority in pitching).";
		} else if (storyCycle == 3 && challenge == 2) {
			jokeSuggestion = "Make a joke paradox joke about the new situation.";
		} else if (storyCycle == 3 && challenge == 3) {
			jokeSuggestion =
					"Show the signature of a person by a joke with the structure observation and recognition.";
		}

		await showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					backgroundColor: Colors.grey[900],
					title: Text('Joke Suggestion', style: TextStyle(color: Colors.cyan)),
					content: Text(jokeSuggestion, style: TextStyle(color: Colors.cyan)),
					actions: [
						ElevatedButton(
							onPressed: () async {
								await showClosedLoopCommunicationPopup(context);
							},
							child: Text('OK', style: TextStyle(color: Colors.cyan)),
						),
					],
				);
			},
		);
	}

	Future<void> showClosedLoopCommunicationPopup(BuildContext context) async {
		String taskPerspective = '';
		String expectationPerspective = '';
		bool? agreed;

		await showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					backgroundColor: Colors.grey[900],
					title: Text(
						'Closed Loop Communication',
						style: TextStyle(color: Colors.cyan),
					),
					content: StatefulBuilder(
						builder: (BuildContext context, setState) {
							return Column(
								mainAxisSize: MainAxisSize.min,
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									TextFormField(
										style: TextStyle(color: Colors.cyan),
										onChanged: (value) {
											taskPerspective = value;
										},
										decoration: InputDecoration(
											labelText:
													'Enter the other parties perspective on the task.',
											labelStyle: TextStyle(color: Colors.cyan),
										),
									),
									TextFormField(
										style: TextStyle(color: Colors.cyan),
										onChanged: (value) {
											expectationPerspective = value;
										},
										decoration: InputDecoration(
											labelText:
													'Enter the other parties perspective on the expectation.',
											labelStyle: TextStyle(color: Colors.cyan),
										),
									),
									Text(
										'Did the other parties think that you achieved the expectation?',
										style: TextStyle(color: Colors.cyan),
									),
									Row(
										children: [
											Radio(
												value: true,
												groupValue: agreed,
												onChanged: (bool? value) {
													setState(() {
														agreed = value;
													});
												},
											),
											Text('Yes', style: TextStyle(color: Colors.cyan)),
											Radio(
												value: false,
												groupValue: agreed,
												onChanged: (bool? value) {
													setState(() {
														agreed = value;
													});
												},
											),
											Text('No', style: TextStyle(color: Colors.cyan)),
										],
									),
									ElevatedButton(
										onPressed: () async {
											passed = agreed! ? 1 : -1;
											Navigator.of(context).pop();
											await showStatusPopup(context);
										},
										child: Text('OK', style: TextStyle(color: Colors.cyan)),
									),
								],
							);
						},
					),
				);
			},
		);
	}

	Future<void> showStatusPopup(BuildContext context) async {
		String statusMessage = passed == 1
				? 'Congratulations! You successfully achieved the expectation.'
				: 'Unfortunately, you did not achieve the expectation.';

		await showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					backgroundColor: Colors.grey[900],
					title: Text('Status', style: TextStyle(color: Colors.cyan)),
					content: SingleChildScrollView(
						child: Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									statusMessage,
									style: TextStyle(color: Colors.cyan),
								),
								TextFormField(
									onChanged: (value) {
										taskObjectStatus = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What new status has the task object?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										taskEnforcerStatus = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What new status has the creator?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										groupStatus = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What new status has the group?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								ElevatedButton(
									onPressed: () {
										Navigator.of(context).pop();
									},
									child: Text('OK', style: TextStyle(color: Colors.cyan)),
								),
							],
						),
					),
				);
			},
		);
	}
}

class SocialContractApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Social Contract Simulator',
			theme: ThemeData.dark().copyWith(
				textTheme: TextTheme(
					bodyText2: TextStyle(color: Colors.cyan),
				),
			),
			home: SocialContractScreen(),
		);
	}
}

class SocialContractScreen extends StatefulWidget {
	@override
	_SocialContractScreenState createState() => _SocialContractScreenState();
}

class _SocialContractScreenState extends State<SocialContractScreen> {
	String need = '';
	String abilities = '';
	String otherContracts = '';
	String task = '';
	String expectation = '';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Social Contract Simulator',
						style: TextStyle(color: Colors.cyan)),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						_showInputDialog(context);
					},
					child: Text('Enter Details'),
				),
			),
		);
	}

	Future<void> _showInputDialog(BuildContext context) async {
		await showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					backgroundColor: Colors.grey[900],
					title: Text('Enter Details', style: TextStyle(color: Colors.cyan)),
					content: SingleChildScrollView(
						child: Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								TextFormField(
									onChanged: (value) {
										need = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What need should the task meet?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										abilities = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What abilities do the players have?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										otherContracts = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'What other contracts frame the task?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										task = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'Task?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								TextFormField(
									onChanged: (value) {
										expectation = value;
									},
									style: TextStyle(color: Colors.cyan),
									decoration: InputDecoration(
										labelText: 'Expectation?',
										labelStyle: TextStyle(color: Colors.cyan),
									),
								),
								ElevatedButton(
									onPressed: () async {
										var result = await SocialContract().cognitiveRestructuring(
											context,
											task,
											expectation,
											"leader",
										);

										if (result != null && result.length == 4) {
											String newTask = result[0];
											String newPassedTask = result[1];
											int? storyCycle = result[2];
											int? challenge = result[3];

											await SocialContract().showJokeSuggestionPopup(
												context,
												storyCycle,
												challenge,
											);
										}
									},
									child: Text('OK', style: TextStyle(color: Colors.cyan)),
								),
							],
						),
					),
				);
			},
		);
	}
}
