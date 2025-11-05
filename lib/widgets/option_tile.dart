import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF8EA664)   // Olive - opsi dipilih
              : const Color(0xFFB5A793),  // Beige brown - opsi default
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: const Color(0xFFF3F1ED), // White gray - teks
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
