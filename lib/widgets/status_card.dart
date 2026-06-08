import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19, left: 21, right: 21, bottom: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white70, Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kondisi Aman',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0C9D61),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Diperbarui 5 Juni 2026, 14.30',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8E8E),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/logo_pondokdiaz.png'),
            ],
          ),
          SizedBox(height: 14),
          Text(
            'Ketinggian air masih dalam batas normal dan belum menunjukkan potensi risiko',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
