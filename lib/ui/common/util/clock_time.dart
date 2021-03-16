import 'package:intl/intl.dart';

//menampilkan tanggal
final dateFormatter = DateFormat('dd-MM-yyyy');
final dateString = dateFormatter.format(DateTime.now());

//menampilkan ucapan
String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Selamat Pagi,';
  }
  if (hour < 17) {
    return 'Selamat Sore,';
  }
  return 'Selamat Malam,';
}
