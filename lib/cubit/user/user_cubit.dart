import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/model/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null) {
    _loadUser();
  }

  void _loadUser() async {
    final box = Hive.box<UserModel>('userBox');
    if (box.isNotEmpty) {
      emit(box.getAt(0));
    }
  }

  void saveUser(UserModel user) async {
    final box = Hive.box<UserModel>('userBox');
    await box.clear();
    await box.add(user);
    emit(user);
  }
}
