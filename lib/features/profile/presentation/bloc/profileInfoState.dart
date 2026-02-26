import 'package:equatable/equatable.dart';
import 'package:sivcam/features/auth/data/models/user.dart';

class ProfileInfoState {
  final User? user;

  ProfileInfoState({this.user});

  ProfileInfoState copyWith({User? user}) {
    return ProfileInfoState(user: user);
  }

  @override
  List<Object?> get props => [user];
}
