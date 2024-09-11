import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MeditationGuideApp());

class MeditationGuideApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				backgroundColor: Colors.black,
				appBar: AppBar(
					title: Text('Meditation Guide in Rhyme'),
					backgroundColor: Colors.black,
				),
				body: MeditationGuide(),
			),
		);
	}
}

class MeditationGuide extends StatefulWidget {
	@override
	_MeditationGuideState createState() => _MeditationGuideState();
}

class _MeditationGuideState extends State<MeditationGuide> {
	FlutterTts flutterTts = FlutterTts();
	bool isPlaying = false;

	@override
	void initState() {
		super.initState();
		// Initialize TTS settings
		flutterTts.setLanguage('en-US');
		flutterTts.setPitch(1.0);
		flutterTts.setSpeechRate(0.5);
	}

	Future<void> _speak(String text) async {
		print("Attempting to speak: $text");

		// Check if language is available
		var isLanguageAvailable = await flutterTts.isLanguageAvailable('en-US');
		if (!isLanguageAvailable) {
			print('The selected language is not available on this device.');
			return;
		}

		// Listen for completion
		flutterTts.setCompletionHandler(() {
			print("Speech completed");
			setState(() {
				isPlaying = false;
			});
		});

		// Speak the text
		await flutterTts.speak(text);
	}

	Future<void> _stop() async {
		print("Stopping speech");
		await flutterTts.stop();
	}

	void _toggleTTS(String text) {
		print("Toggling TTS: $text");
		setState(() {
			if (isPlaying) {
				_stop();
			} else {
				_speak("$text");
			}
			isPlaying = !isPlaying;
		});
	}

	@override
	void dispose() {
		_stop();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return SingleChildScrollView(
			padding: EdgeInsets.all(16.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(
						'Meditation Guide in Rhyme',
						style: TextStyle(
								color: const Color(0xFFED9121),
								fontSize: 24,
								fontWeight: FontWeight.bold),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () =>
								_toggleTTS('What: Pause and Feel - Impermanence I reveal. '
										'Inhale with mirrors in sight, and crystal balls alight. '
										'Exhale, Be Strong - Emotions to me belong.'
										'Inhale and Say - "May emotions bring joy each day.'),
						child: Text(isPlaying
								? '\u23F9 TTS'
								: '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					SizedBox(height: 20),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'What:\n\u23F3 Pause and Feel - Impermanence I reveal.\n\u267B Inhale with mirrors in sight, and crystal balls alight. \n\u270A Exhale, Be Strong - Emotions to me belong.\n\u2600 Inhale and Say - "May emotions bring joy each day."\n\n',
								),
							],
						),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () =>
								_toggleTTS('Pause and See - Change stirs up unease in me.'
										'Inhale with mirrors in sight, and crystal balls alight. '
										'Exhale with Might - Determination in sight.'
										'Inhale and say - "Acceptance makes health stay."'),
						child: Text(isPlaying ? '\u23F9 TTS' : '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					SizedBox(height: 20),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'How:\n\u2639 Pause and See - Change stirs up unease in me.\n\u267B Inhale with mirrors in sight, and crystal balls alight.  \n\u25CB\u25C9 Exhale with Might - Determination in sight.\n\u2714 Inhale and say - "Acceptance makes health stay."\n\n',
								),
							],
						),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () =>
								_toggleTTS('Pause and Detach - From self, emotions unlatch.'
										'Inhale with mirrors in sight, and crystal balls alight.'
										'Exhale, Embrace - the new with grace.'
										'Inhale and Plea - "May I live in peace with me."'),
						child: Text(isPlaying ? '\u23F9 TTS' : '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					SizedBox(height: 20),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'Why:\n\u270B Pause and Detach - From self, emotions unlatch.\n\u267B Inhale with mirrors in sight, and crystal balls alight. \n\u263A Exhale, Embrace - the new with grace.\n\u262E Inhale and Plea - "May I live in peace with me."\n',
								),
							],
						),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () => _toggleTTS(
								'What destination do you want to review? What path of ours will guide you through?'),
						child: Text(isPlaying ? '\u23F9 TTS' : '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					SizedBox(height: 20),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'\n\n----------------\n"I feel X when Y”\nAnd the fairy continued:\n“and therefore you must, should, could, or won’t make Z-road."\nTogether in choir they the troll and fairy then say:\n“What destination do you want to review? What path of ours will guide you through?”\n\n',
								),
							],
						),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () => _toggleTTS(
								'In troll’s mirror, pains remain. In Fairy’s ball, we seek our gain.'),
						child: Text(isPlaying ? '\u23F9 TTS' : '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'In troll’s mirror, pains remain. In Fairy’s ball, we seek our gain.',
								),
							],
						),
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () => _toggleTTS(
								'A chance to grow, to learn, and gain,\nfrom each experience, not in vain.'),
						child: Text(isPlaying ? '\u23F9 TTS' : '\u23F5 TTS'),
						style: ElevatedButton.styleFrom(
							foregroundColor: const Color(0xaa000000),
							backgroundColor: isPlaying ? const Color(0xffff0000) : const Color(0xff555555),
						),
					),
					RichText(
						text: TextSpan(
							style: TextStyle(color: const Color(0xFFED9121), fontSize: 18),
							children: [
								TextSpan(
									text:
											'"A chance to grow, to learn, and gain,\nfrom each experience, not in vain."\n\n',
								),
							],
						),
					)
				],
			),
		);
	}
}