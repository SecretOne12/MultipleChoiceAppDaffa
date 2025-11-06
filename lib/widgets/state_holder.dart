import '../data/question_list.dart';

class QuizState {
  /// Singleton (agar state tetap sama di semua halaman)
  QuizState._privateConstructor();
  static final QuizState instance = QuizState._privateConstructor();

  String username = "";         // Nama user
  int score = 0;                // Skor total
  int currentIndex = 0;         // Index soal saat ini
  String? selectedAnswer;       // Jawaban yang dipilih user saat ini

  ///  Menyimpan jawaban setiap soal, jadi bisa balik ke soal sebelumnya
  List<String?> answers = List.filled(questions.length, null);

  /// Reset semua data (dipanggil di halaman nama atau ketika restart quiz)
  void reset() {
    username = "";
    score = 0;
    currentIndex = 0;
    selectedAnswer = null;
    answers = List.filled(questions.length, null);   // Reset jawaban tersimpan
  }

  ///  Fungsi ketika memilih jawaban
  void selectAnswer(String answer, String correctAnswer) {
    selectedAnswer = answer;
    answers[currentIndex] = answer;

    // Update score hanya jika sebelumnya belum terjawab
    if (answer == correctAnswer) {
      score++;
    }
  }

  /// ✅ Ke soal berikutnya
  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      selectedAnswer = answers[currentIndex]; // Restore pilihan sebelumnya
    }
  }

  /// ✅ Kembali ke soal sebelumnya
  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      selectedAnswer = answers[currentIndex]; // Restore jawaban sebelumnya
    }
  }
}
