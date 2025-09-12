import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/model/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null) {
    loadUser();
  }

  void loadUser() {
    final box = Hive.box<UserModel>('userBox');
    final savedUser = box.get('user');
    if (savedUser != null) {
      emit(savedUser);
    }
  }

  void saveUser(UserModel user) async {
    final box = Hive.box<UserModel>('userBox');
    await box.put('user', user);
    emit(user);
  }

  void updateUserImage(String imagePath) async {
    final box = Hive.box<UserModel>('userBox');

    if (state != null) {
      final updatedUser = state!.copyWith(imagePath: imagePath);

      await box.put('user', updatedUser);
      emit(updatedUser);
    }
  }

  void logout() async {
    final box = Hive.box<UserModel>('userBox');
    await box.delete('user');
    emit(null);
  }
}
