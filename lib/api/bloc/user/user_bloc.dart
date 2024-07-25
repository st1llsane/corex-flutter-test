import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AbstractUserRepo userRepo;

  UserBloc(this.userRepo) : super(UsersInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        emit(UsersLoading());

        final users = await userRepo.getUsers();

        emit(UsersLoaded(users: users));
      } catch (e) {
        emit(UsersLoadingError(exception: e));
      }
    });

    on<LoadUserById>((event, emit) async {
      try {
        emit(UserByIdLoading());

        final user = await userRepo.getUserById(event.userId);

        emit(UserByIdLoaded(user: user));
      } catch (e) {
        emit(UserByIdLoadingError(exception: e));
      }
    });
  }
}