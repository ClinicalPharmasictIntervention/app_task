import 'package:flutter/material.dart';
import 'package:trainingtask/shared/bloc_observer.dart';
import 'package:trainingtask/view/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingtask/view_model/app_cubit/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getUsers()
            ..getPhotos()
            ..getAlbums(),
        ),
      ],
      child: MaterialApp(
        home: ProfileScreen(),
      ),
    );
  }
}
