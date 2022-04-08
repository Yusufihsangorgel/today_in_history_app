part of 'today_cubit.dart';

@immutable
abstract class TodayState {
  final Color color;
  final Icon iconChange;
  TodayState(
      {this.color = Colors.black,
      this.iconChange = const Icon(Icons.arrow_drop_down_circle)});
}

class Today extends TodayState {
  Today({required Color color, required Icon iconChange})
      : super(color: color, iconChange: Icon(Icons.arrow_drop_down_circle));
}
