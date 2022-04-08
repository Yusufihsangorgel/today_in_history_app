import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tarihte_bugun_app/pages/Today/bloc/post_bloc.dart';
import 'package:tarihte_bugun_app/pages/Today/widget/todayWidget/cubit/today_cubit.dart';

import 'package:tarihte_bugun_app/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    //Birden fazla bloc provider koymaya yarar.
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc()..add(RequestPostEvent()),
        ),
        BlocProvider<TodayCubit>(create: (context) => TodayCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Material App',
        onGenerateRoute: _appRouter.sayfaGecisleri,
      ),
    );
  }
}
