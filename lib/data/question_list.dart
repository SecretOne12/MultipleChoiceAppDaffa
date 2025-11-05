class Question {
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

final List<Question> questions = [
  Question(
    question: '1. Apa kepanjangan dari CPU?',
    options: [
      'Central Process Unit',
      'Central Processing Unit',
      'Computer Personal Unit',
      'Control Processing User',
    ],
    correctIndex: 1,
  ),
  Question(
    question: '2. Bahasa pemrograman manakah yang digunakan untuk mengembangkan Flutter?',
    options: ['Java', 'Kotlin', 'Dart', 'Python'],
    correctIndex: 2,
  ),
  Question(
    question: '3. Apa fungsi utama dari loop dalam pemrograman?',
    options: [
      'Menghentikan program',
      'Mengulang perintah beberapa kali',
      'Menjalankan fungsi hanya sekali',
      'Menghapus variabel',
    ],
    correctIndex: 1,
  ),
  Question(
    question: '4. Tipe data manakah yang digunakan untuk menyimpan nilai benar/salah?',
    options: ['String', 'Integer', 'Boolean', 'Double'],
    correctIndex: 2,
  ),
  Question(
    question: '5. Apa nama struktur data yang menyimpan data berurutan dan dapat diakses dengan indeks?',
    options: ['Array', 'Map', 'Set', 'Queue'],
    correctIndex: 0,
  ),
  Question(
    question: '6. Apa fungsi utama dari perintah "if" dalam bahasa pemrograman?',
    options: [
      'Menjalankan perulangan',
      'Mengevaluasi kondisi dan menentukan alur program',
      'Menghapus data',
      'Menampilkan output ke layar',
    ],
    correctIndex: 1,
  ),
  Question(
    question: '7. Apa hasil dari operasi 10 % 3 dalam bahasa pemrograman?',
    options: ['1', '2', '3', '0'],
    correctIndex: 1,
  ),
  Question(
    question: '8. Bahasa pemrograman manakah yang tidak termasuk ke dalam bahasa berorientasi objek?',
    options: ['C', 'Java', 'Python', 'C++'],
    correctIndex: 0,
  ),
  Question(
    question: '9. Dalam Flutter, widget yang dapat berubah disebut?',
    options: [
      'StatelessWidget',
      'StatefulWidget',
      'ImmutableWidget',
      'UnchangeableWidget',
    ],
    correctIndex: 1,
  ),
  Question(
    question: '10. Apa fungsi dari komentar dalam kode program?',
    options: [
      'Menjalankan kode tambahan',
      'Menonaktifkan kode',
      'Memberikan penjelasan tanpa dijalankan',
      'Menghapus baris program',
    ],
    correctIndex: 2,
  ),
];
