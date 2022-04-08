import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarihte_bugun_app/pages/Today/bloc/post_bloc.dart';
import 'package:tarihte_bugun_app/pages/Today/indicators/warp_indicator.dart';
import 'package:tarihte_bugun_app/pages/Today/widget/todayWidget/todayWidget.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WarpIndicator(
      onRefresh: () async {
        BlocProvider.of<PostBloc>(context).add(RequestPostEvent());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.exit_to_app)),
          backgroundColor: Colors.brown[700],
          title: const Text(
            "Tarihte Bugün Yaşanan Olaylar",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              const snackBar =
                  SnackBar(content: Text('Beklenmedik bir hata çıktı'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: _body(),
        ),
      ),
    );
  }

  BlocBuilder<PostBloc, PostState> _body() {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return TodayWidget(
                  current: state.posts[index].durum,
                  year: state.posts[index].yil,
                  status: state.posts[index].olay);
            },
          );
        } else if (state is PostLoading) {
          return _loading();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Center _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
