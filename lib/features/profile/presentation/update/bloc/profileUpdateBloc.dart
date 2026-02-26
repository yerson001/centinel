import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateEvent.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateState.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {});
  }
}
