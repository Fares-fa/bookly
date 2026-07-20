import '../../imports/imports.dart';

/// Renders [spans] with only the first [revealedCount] characters visible,
/// for building a typewriter/typing-reveal effect one character at a time.
///
/// The full text is painted first at zero opacity purely to reserve layout
/// space, then the revealed slice is painted on top — so the surrounding
/// layout never jumps around as more characters appear.
///
/// Usage:
/// ```dart
/// AppReservedTypingText(
///   spans: [TextSpan(text: 'Bookly.', style: titleStyle)],
///   revealedCount: _titleRevealCount, // driven by a Timer.periodic tick
/// )
/// ```
class AppReservedTypingText extends StatelessWidget {
  const AppReservedTypingText({
    super.key,
    required this.spans,
    required this.revealedCount,
    this.alignment = AlignmentDirectional.topStart,
    this.textAlign,
  });

  final List<TextSpan> spans;
  final int revealedCount;
  final AlignmentGeometry alignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Opacity(
          opacity: 0,
          child: RichText(textAlign: textAlign ?? TextAlign.start, text: TextSpan(children: spans)),
        ),
        RichText(
          textAlign: textAlign ?? TextAlign.start,
          text: TextSpan(children: _reveal()),
        ),
      ],
    );
  }

  List<TextSpan> _reveal() {
    final revealed = <TextSpan>[];
    var remaining = revealedCount;
    for (final span in spans) {
      final text = span.text ?? '';
      final take = remaining.clamp(0, text.length);
      revealed.add(TextSpan(text: text.substring(0, take), style: span.style));
      remaining -= take;
    }
    return revealed;
  }
}
