import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingtask/view_model/app_cubit/cubit.dart';
import 'package:trainingtask/view_model/app_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class PhotosScreen extends StatelessWidget {
  PhotosScreen({this.albumTitle});

  String? albumTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Photos',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.specPhotos.isNotEmpty,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$albumTitle',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConditionalBuilder(
                    condition: cubit.specPhotos.isNotEmpty,
                    builder: (context) => Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => Container(
                          width: 600,
                          height: 600,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                cubit.specPhotos[index].url!,
                              ),
                            ),
                          ),
                        ),
                        itemCount: cubit.specPhotos.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
