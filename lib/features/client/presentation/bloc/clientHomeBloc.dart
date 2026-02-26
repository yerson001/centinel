import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeEvent.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUseCases authUseCases;

  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });

    on<Logout>((event, emit) async {
      await authUseCases.logout.run();
    });
  }
}
