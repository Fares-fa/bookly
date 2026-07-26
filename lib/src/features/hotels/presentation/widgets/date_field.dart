import 'package:bookly/src/imports/imports.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.label,
    required this.date,
    required this.formatDate,
    required this.onTap,
  });

  final String label;
  final DateTime? date;
  final String Function(DateTime) formatDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style:
                        tt.bodySmall?.copyWith(color: const Color(0xFF666666)),
                  ),
                  Text(
                    date != null ? formatDate(date!) : 'Select date',
                    style: tt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: date != null
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.calendar_today_outlined,
                size: 18, color: Color(0xFF666666)),
          ],
        ),
      ),
    );
  }
}
