import 'package:flutter/material.dart';
import 'package:sivcam/features/auth/data/models/user.dart';
import 'package:sivcam/features/profile/presentation/update/profileUpdateContent.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  User? user;
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(body: ProfileUpdateContent(state, user));
  }
}
