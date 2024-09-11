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

class _MeditationGuideState extends State<MeditationGuide> with TickerProviderStateMixin {
	FlutterTts flutterTts = FlutterTts();
	bool isPlaying = false;

	// Animation controller for gradient glow effect
	late AnimationController _controller;

	@override
	void initState() {
		super.initState();
		_controller = AnimationController(
			vsync: this,
			duration: Duration(seconds: 2),
		)..repeat(reverse: true); // Repeat the animation to create a glowing effect

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
				_speak(text);
			}
			isPlaying = !isPlaying;
		});
	}

	@override
	void dispose() {
		_controller.dispose();
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
							fontWeight: FontWeight.bold,
						),
					),
					SizedBox(height: 20),
					_buildGlowingButton(
						text: 'What: Pause and Feel - Impermanence I reveal...',
						buttonText: isPlaying ? 'Stop TTS' : 'Start TTS',
					),
					SizedBox(height: 20),
					_buildGlowingButton(
						text: 'Pause and See - Change stirs up unease in me...',
						buttonText: isPlaying ? 'Stop TTS' : 'Start TTS',
					),
					SizedBox(height: 20),
					_buildGlowingButton(
						text: 'Pause and Detach - From self, emotions unlatch...',
						buttonText: isPlaying ? 'Stop TTS' : 'Start TTS',
					),
				],
			),
		);
	}

	Widget _buildGlowingButton({required String text, required String buttonText}) {
		return ElevatedButton(
			onPressed: () => _toggleTTS(text),
			child: Text(buttonText),
			style: ButtonStyle(
				foregroundColor: MaterialStateProperty.all<Color>(const Color(0xaa000000)),
				padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 16.0)),
				backgroundColor: isPlaying
						? MaterialStateProperty.all(Colors.transparent)
						: MaterialStateProperty.all(const Color(0xff00aa00)),
				overlayColor: MaterialStateProperty.all(Colors.transparent),
			),
		);
	}

	// Widget to build gradient and glow animation for buttons
	Widget _buildGlowingEffect(Widget child) {
		return ShaderMask(
			shaderCallback: (bounds) {
				return RadialGradient(
					center: Alignment.center,
					radius: 1.0,
					colors: <Color>[Colors.red, Colors.transparent],
					stops: <double>[0.5, 1.0],
				).createShader(bounds);
			},
			child: child,
		);
	}
}
