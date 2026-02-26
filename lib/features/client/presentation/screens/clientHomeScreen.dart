import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeBloc.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeEvent.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeState.dart';
import 'package:sivcam/features/profile/presentation/profileInfoScreen.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClienthomeState();
}

class _ClienthomeState extends State<ClientHomeScreen> {
  List<Widget> pageList = <Widget>[ProfileInfoScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu de Opciones')),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text(
                    'Menu del cliente',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text('perfil de usurio'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0),
                    );
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  title: Text('Cerrar Session'),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'onboard', // o la ruta que corresponda
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
