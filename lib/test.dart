import 'package:intl/intl.dart';

void main() {
  // Chuỗi thời gian
  String dateTimeString = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

  // Định dạng của chuỗi thời gian
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

  // Phân tích chuỗi thành DateTime
  DateTime dateTime = dateFormat.parse(dateTimeString);

  // Chuyển DateTime thành Unix timestamp (milliseconds since epoch)
  int timestampMilliseconds = dateTime.millisecondsSinceEpoch;

  // Chuyển DateTime thành Unix timestamp (seconds since epoch)
  int timestampSeconds = (dateTime.millisecondsSinceEpoch / 1000).round();

  // In ra kết quả
  print('Chuỗi thời gian: $dateTimeString');
  print('Timestamp (milliseconds): $timestampMilliseconds');
  print('Timestamp (seconds): $timestampSeconds');
}
