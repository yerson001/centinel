import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoEvent.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoState.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<GetUserInfo>((event, emit) async {
      AuthResponse? authResponse = await authUseCases.getSession.run();
      emit(state.copyWith(user: authResponse?.user));
    });
  }
}
