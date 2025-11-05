import 'package:flutter/material.dart';
import '../data/question_list.dart';
import '../widgets/state_holder.dart';
import 'quiz_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});
  static const String routeName = "/name";


  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _startQuiz() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nama terlebih dahulu')),
      );
      return;
    }

    QuizState.instance.reset();
    QuizState.instance.username = name;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFC6D4AC), // #C6D4AC

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Masukkan Nama",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5E6548), // #5E6548
              ),
            ),

            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F1ED), // #F3F1ED
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Nama Anda...",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: size.width * 0.45,
              height: 48,
              child: ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8EA664), // #8EA664
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Mulai Kuis",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Jumlah Soal: ${questions.length}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xFF5E6548),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
