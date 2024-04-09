import 'package:bloc/bloc.dart';
import 'package:eco/services/authorization/repos/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginState.initial()) {
    on<LoginSubmitted>(_onSubmitted);
    on<SignOut>(_signOut);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginState.loading());

      await _authenticationRepository.logIn(username: event.username, userPassword: event.userPassword);
      emit(LoginState.success());
    } catch (exception, stackTrace) {
      emit(LoginState.failure(exception, stackTrace));
    }
  }

  Future<void> _signOut(
    final SignOut event,
    final Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());

    await _authenticationRepository.logOut();
    emit(LoginState.success());
  }
}
