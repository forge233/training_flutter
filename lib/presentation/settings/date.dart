import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('dd MMM y');
final String formattedDate = formatter.format(now);