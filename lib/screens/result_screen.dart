import 'package:flutter/material.dart';
import '../widgets/state_holder.dart';
import 'name_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static const String routeName = "/screen";


  @override
  Widget build(BuildContext context) {
    final quizState = QuizState.instance;

    return Scaffold(
      backgroundColor: const Color(0xFFC6D4AC), // background halaman

      appBar: AppBar(
        backgroundColor: const Color(0xFF8EA664), // header hijau olive
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Hasil Kuis",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F1ED), // container hasil skor
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Selamat, ${quizState.username}!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5E6548), // hijau gelap
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Skor Anda",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    color: const Color(0xFF5E6548),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  "${quizState.score}",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8EA664), // hijau olive
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8EA664),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      quizState.reset();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NameScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Kembali ke Halaman Awal",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
