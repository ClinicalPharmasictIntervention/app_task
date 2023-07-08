import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingtask/view/photos_screen.dart';
import 'package:trainingtask/view_model/app_cubit/cubit.dart';
import 'package:trainingtask/view_model/app_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        cubit.getMyAlbums();
        print(cubit.myAlbums.length);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.users.isNotEmpty,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cubit.users[0].name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${cubit.users[0].address!.street}, ${cubit.users[0].address!.suite}, ${cubit.users[0].address!.city}, ${cubit.users[0].address!.city}, ${cubit.users[0].address!.zipcode},',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'My Albums',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          '${cubit.myAlbums[index].title}',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          cubit.getSpecificPhotos(
                            albumID: cubit.myAlbums[index].id!,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotosScreen(
                                albumTitle: cubit.myAlbums[index].title,
                              ),
                            ),
                          );
                        },
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: 0.5,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      itemCount: cubit.myAlbums.length,
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
