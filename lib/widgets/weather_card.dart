import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  final bool rainDetected;

  const WeatherCard({super.key, this.rainDetected = false});

  static const _dryGradient = [Color(0xFFF0A926), Color(0xFFF09226)];
  static const _rainGradient = [Color(0xFF3FA5EB), Color(0xFF0A8AE2)];
  static const _dryIcon = Color(0xFFF0A926);
  static const _rainIcon = Color(0xFF0A8AE2);

  @override
  Widget build(BuildContext context) {
    final iconAsset = rainDetected
        ? 'assets/images/symbol_rain.png'
        : 'assets/images/symbol_cloud.png';
    final label = rainDetected ? 'Hujan' : 'Tidak Hujan';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: rainDetected ? 1.0 : 0.0),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        builder: (context, t, _) {
          final iconColor = Color.lerp(_dryIcon, _rainIcon, t)!;
          final gradient = [
            Color.lerp(_dryGradient[0], _rainGradient[0], t)!,
            Color.lerp(_dryGradient[1], _rainGradient[1], t)!,
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuaca',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFEEEEEE)),
                    ),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: _switchTransition,
                        child: Image.asset(
                          iconAsset,
                          key: ValueKey(iconAsset),
                          width: 24,
                          height: 24,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: _switchTransition,
                  child: Text(
                    label,
                    key: ValueKey(label),
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _switchTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.04, end: 1.0).animate(animation),
        child: child,
      ),
    );
  }
}
