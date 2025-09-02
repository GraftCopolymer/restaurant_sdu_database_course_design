import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'table_edit_provider.g.dart';

@riverpod
class TableEditNotifier extends _$TableEditNotifier {
  @override
  Table build([Table? table]) {
    if (table != null) {
      return table;
    }
    return Table();
  }

  /// 返回 false 说明有重复
  bool addSeat(String seatNumber) {
    // 检查是否有重复
    for (final s in state.seats) {
      if (s.seatNumber == seatNumber) {
        return false;
      }
    }
    final newSeat = Seat()
      ..tableId = state.id
      ..seatNumber = seatNumber;
    final table = state.deepCopy();
    table.seats.add(newSeat);
    state = table;
    return true;
  }

  void updateSeat(Seat seat) {
    if (!seat.hasSeatNumber()) {
      return;
    }
    int index = 0;
    final copy = List<Seat>.from(state.seats);
    for (final s in copy) {
      if (s.seatNumber == seat.seatNumber) {
        copy[index] = seat;
        break;
      }
      index++;
    }
    final table = state.deepCopy();
    table.seats.clear();
    table.seats.addAll(copy);
    state = table;
  }

  void updateByIndex(Seat seat, int index) {
    if (index < 0 || index >= state.seats.length) {
      return;
    }
    final table = state.deepCopy();
    table.seats[index] = seat;
    state = table;
  }

  /// 返回 false 说明索引超出范围
  bool deleteByIndex(int index) {
    if (index < 0 || index >= state.seats.length) {
      return false;
    }
    final table = state.deepCopy();
    table.seats.removeAt(index);
    state = table;
    return true;
  }
}