import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoBloc.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoState.dart';
import 'package:sivcam/features/profile/presentation/profileInfoContent.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
      builder: (context, state) {
        return ProfileInfoContent(state.user);
      },
    );
  }
}
