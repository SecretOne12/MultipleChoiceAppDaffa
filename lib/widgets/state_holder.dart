import '../data/question_list.dart';

class QuizState {
  // Singleton (agar state tetap sama di semua halaman)
  QuizState._privateConstructor();
  static final QuizState instance = QuizState._privateConstructor();

  String username = "";     // Menyimpan nama player
  int score = 0;            // Skor total
  int currentIndex = 0;     // Index soal saat ini
  String? selectedAnswer;   // Jawaban yang dipilih user

  // Reset saat kembali ke halaman awal
  void reset() {
    username = "";
    score = 0;
    currentIndex = 0;
    selectedAnswer = null;
  }

  // Fungsi ketika user memilih jawaban
  void selectAnswer(String answer, String correctAnswer) {
    selectedAnswer = answer;
    if (answer == correctAnswer) {
      score++;
    }
  }

  // Pindah ke soal berikutnya
  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      selectedAnswer = null;
    }
  }
}
