import 'package:flutter/material.dart';
import 'package:sivcam/features/auth/data/models/user.dart';

class ProfileInfoContent extends StatelessWidget {
  final User? user;

  ProfileInfoContent(this.user, {super.key});

  final Color _greenStart = const Color(0xFF128C7E);
  final Color _greenEnd = const Color(0xFF25D366);
  final Color _grayText = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userCard(context),
            const SizedBox(height: 25),
            _activityCard(),
            const SizedBox(height: 25),
            _sectionTitle('Configuración General'),
            _settingsCard(
              icon: Icons.edit,
              title: 'Editar perfil',
              onTap: () {
                Navigator.pushNamed(context, 'profile/update', arguments: user);
              },
            ),
            const SizedBox(height: 25),
            _sectionTitle('Preferencias'),
            _settingsCard(
              icon: Icons.logout,
              title: 'Cerrar sesión',
              onTap: () {
                //context.read<ProfileInfoBloc>().add(OutLogInfo());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'login', // o la ruta que corresponda
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _userCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_greenStart, _greenEnd],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'PERFIL DE USUARIO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            backgroundImage: user?.image != null
                ? NetworkImage(user!.image!)
                : const AssetImage('assets/images/user_image.png')
                      as ImageProvider,
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '${user?.name ?? ''} ${user?.lastname ?? ''}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                _infoRow(Icons.credit_card, user?.dni ?? '', opacity: 0.6),
                const SizedBox(height: 5),
                _infoRow(Icons.phone, user?.phone ?? '', opacity: 0.6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String value, {double opacity = 1.0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.grey.withOpacity(opacity)),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black.withOpacity(opacity),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _activityCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Actividad del Usuario'),
        const SizedBox(height: 10),
        Row(
          children: [
            _activityItem('Activo', Icons.check_circle, Colors.green),
            const SizedBox(width: 10),
            _activityItem('Último acceso', Icons.access_time, Colors.blue),
            const SizedBox(width: 10),
            _activityItem('Verificación', Icons.verified_user, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _activityItem(String title, IconData icon, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(icon, size: 28, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: _greenEnd),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
