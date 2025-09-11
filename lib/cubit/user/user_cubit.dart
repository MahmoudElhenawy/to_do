import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/model/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null) {
    _loadUser();
  }

  void _loadUser() async {
    final box = Hive.box<UserModel>('userBox');
    final user = box.get('currentUser');
    if (user != null) {
      emit(user);
    }
  }

  void saveUser(UserModel user) async {
    final box = Hive.box<UserModel>('userBox');
    await box.put('currentUser', user);
    emit(user);
  }
}
