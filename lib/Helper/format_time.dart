import 'package:intl/intl.dart';

String formatTime(String? rawTime) {
  if (rawTime == null || rawTime.isEmpty) return '';
  try {
    final dateTime = DateTime.parse(rawTime);
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else {
      return DateFormat('MMM dd, yyyy').format(dateTime); // May 08, 2024
    }
  } catch (e) {
    return rawTime;
  }
}