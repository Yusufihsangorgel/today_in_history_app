import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/timer.gif'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                      'Tarihte Bugün Uygulamasına Hoş Geldin',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      cursor: '<|>'),
                  TypewriterAnimatedText(
                      'Aşağıda Bulunan Butona Tıkladığın Takdir de  ',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      cursor: '<|>'),
                  TypewriterAnimatedText('Zamanda bir yolculağa çıkacak ve',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      cursor: '<|>'),
                  TypewriterAnimatedText(
                      'Geçmiş Zamanda Bugün Yaşanan Olayları ',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      cursor: '<|>'),
                  TypewriterAnimatedText('Görme Fırsatına Erişeceksin.!!',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      cursor: '💡'),
                ],
                pause: const Duration(milliseconds: 1000),
                repeatForever: true,
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 100.0,
                ),
                child: Splash())
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.grey[900],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.pushNamed(context, '/splash');
        },
        child: const Text("Yolculuğu Başlat!"));
  }
}
