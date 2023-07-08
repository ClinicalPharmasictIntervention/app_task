import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingtask/constants/end_points.dart';
import 'package:trainingtask/model/album_model.dart';
import 'package:trainingtask/model/photo_model.dart';
import 'package:trainingtask/model/user_model.dart';
import 'package:trainingtask/shared/network/remote/http_helper.dart';
import 'package:trainingtask/view_model/app_cubit/states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static get(context) => BlocProvider.of<AppCubit>(context);

  late List<UserModel> users = [];
  late List<AlbumModel> albums = [];
  late List<PhotoModel> photos = [];

  void getUsers() async {
    await HttpHelper.getData(endpoint: USERS);
    for (var element in HttpHelper.data) {
      users.add(UserModel.fromJson(element));
    }
    if (HttpHelper.response.statusCode == 200) {
      emit(AppGetUsersSuccess());
    } else {
      emit(AppGetUsersError());
    }
  }

  void getAlbums() async {
    await HttpHelper.getData(endpoint: ALBUMS);
    for (var element in HttpHelper.data) {
      albums.add(AlbumModel.fromJson(element));
    }
    if (HttpHelper.response.statusCode == 200) {
      emit(AppGetAlbumsSuccess());
    } else {
      emit(AppGetAlbumsError());
    }
  }

  void getPhotos() async {
    await HttpHelper.getData(endpoint: PHOTOS);
    for (var element in HttpHelper.data) {
      photos.add(PhotoModel.fromJson(element));
    }
    if (HttpHelper.response.statusCode == 200) {
      emit(AppGetPhotosSuccess());
    } else {
      emit(AppGetPhotosError());
    }
  }

  List<AlbumModel> myAlbums = [];

  void getMyAlbums() {
    myAlbums = albums.where((element) => element.userId == 1).toList();
  }

  List<PhotoModel> specPhotos = [];

  void getSpecificPhotos({required int albumID}) {
    specPhotos = [];
    specPhotos = photos.where((element) => element.albumId == albumID).toList();
  }
}
