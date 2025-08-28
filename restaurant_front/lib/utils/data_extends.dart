import 'package:decimal/decimal.dart';

extension StringDecimal on String {
  Decimal d() {
    return Decimal.parse(this);
  }
}