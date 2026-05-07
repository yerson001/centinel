import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/data/models/user.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateBloc.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateEvent.dart';
import 'package:sivcam/features/profile/presentation/update/bloc/profileUpdateState.dart';
import 'package:sivcam/features/profile/presentation/update/profileUpdateContent.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    // Obtener el usuario de los argumentos de la ruta
    WidgetsBinding.instance.addPostFrameCallback((_) {
      user = ModalRoute.of(context)?.settings.arguments as User?;
      if (user != null) {
        context.read<ProfileUpdateBloc>().add(
          ProfileUpdateInitEvent(user: user),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User?;

    return BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
      builder: (context, state) =>
          ProfileUpdateContent(state, user),
    );
  }
}
