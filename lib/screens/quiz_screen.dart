import 'package:flutter/material.dart';
import '../data/question_list.dart';
import '../widgets/state_holder.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  static const String routeName = "/quiz";

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final quizState = QuizState.instance;
    final currentQuestion = questions[quizState.currentIndex];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFC6D4AC), // #C6D4AC

      appBar: AppBar(
        backgroundColor: const Color(0xFF8EA664),
        elevation: 0,
        title: Text(
          "Soalan gampang nieh",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- Indikator nomor soal ---
            Text(
              "Soal ${quizState.currentIndex + 1} dari ${questions.length}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5E6548),
              ),
            ),

            const SizedBox(height: 15),

            // --- Card soal ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F1ED),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                currentQuestion.question,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5E6548),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- List Pilihan Jawaban ---
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  final optionText = currentQuestion.options[index];
                  final isSelected = quizState.answers[quizState.currentIndex] == optionText;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: size.width * 0.035),
                        backgroundColor: isSelected
                            ? const Color(0xFF8EA664)
                            : const Color(0xFFB5A793),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          quizState.selectAnswer(
                            optionText,
                            currentQuestion.options[currentQuestion.correctIndex],
                          );
                        });
                      },
                      child: Text(
                        optionText,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // --- Tombol Prev dan Next ---
            Row(
              children: [
                // Tombol Sebelumnya
                if (quizState.currentIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB5A793),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          quizState.previousQuestion();
                        });
                      },
                      child: const Text(
                        "Kembali",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                if (quizState.currentIndex > 0) const SizedBox(width: 10),

                // Tombol lanjut atau selesai
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8EA664),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      if (quizState.currentIndex < questions.length - 1) {
                        setState(() {
                          quizState.nextQuestion();
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResultScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      quizState.currentIndex < questions.length - 1
                          ? "Lanjut"
                          : "Selesai",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
