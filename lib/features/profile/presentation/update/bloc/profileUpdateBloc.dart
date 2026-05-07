import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateEvent.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateState.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, formKey: formKey));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastName: event.lastname, formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone, formKey: formKey));
    });

    on<PickImage>((event, emit) {
      // TODO: Implementar selección de imagen desde galería
    });

    on<TakePhoto>((event, emit) {
      // TODO: Implementar captura de foto
    });

    on<FormSubmit>((event, emit) {
      // TODO: Implementar envío del formulario
    });
  }
}
