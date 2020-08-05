
import 'package:intl/intl.dart';

String dateFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);

  if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    final dtFormat = DateFormat('MM-DD');
    return dtFormat.format(dt);
  } else {
    final dtFormat = DateFormat('yyyy-MM-DD');
    return dtFormat.format(dt);
  }
}