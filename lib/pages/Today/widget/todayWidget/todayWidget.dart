import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarihte_bugun_app/pages/Today/widget/todayWidget/cubit/today_cubit.dart';

class TodayWidget extends StatefulWidget {
  final String year;
  final String status;
  final String current;
  const TodayWidget(
      {Key? key,
      required this.year,
      required this.status,
      required this.current})
      : super(key: key);

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayCubit, TodayState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: () {},
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          BlocProvider.of<TodayCubit>(context).changeColor();
                        },
                        trailing: state.iconChange,
                        leading: Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                        title: Text(
                          widget.current,
                          style: TextStyle(
                              color: state.color, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          widget.year,
                          style: TextStyle(
                              color: state.color, fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                            widget.status,
                            style: TextStyle(
                                color: state.color,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
