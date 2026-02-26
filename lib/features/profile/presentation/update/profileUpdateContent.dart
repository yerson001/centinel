import 'package:flutter/material.dart';
import 'package:sivcam/features/auth/data/models/user.dart';

class ProfileUpdateContent extends StatelessWidget {
  final User? user;
  final ProfileUpdateState state;

  const ProfileUpdateContent(this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo degradado que ocupa toda la pantalla
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF128C7E), Color(0xFF25D366)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Contenido desplazable
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: Form(
              key: state.formKey, // Asegúrate de tener el formKey
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Card con avatar y formulario
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          _imageUser(context),
                          const SizedBox(height: 20),
                          MinimalTextField(
                            label: 'Nombre',
                            icon: Icons.person,
                            initialValue: user?.name,
                            onChanged: (text) =>
                                context.read<ProfileUpdateBloc>().add(
                                  NameChanged(name: BlocFormItem(value: text)),
                                ),
                            validator: (_) => state.name.error,
                          ),
                          MinimalTextField(
                            label: 'Apellido',
                            icon: Icons.person_outline,
                            initialValue: user?.lastname,
                            onChanged: (text) =>
                                context.read<ProfileUpdateBloc>().add(
                                  LastNameChanged(
                                    lastname: BlocFormItem(value: text),
                                  ),
                                ),
                            validator: (_) => state.lastname.error,
                          ),
                          MinimalTextField(
                            label: 'Teléfono',
                            icon: Icons.phone,
                            initialValue: user?.phone,
                            onChanged: (text) =>
                                context.read<ProfileUpdateBloc>().add(
                                  PhoneChanged(
                                    phone: BlocFormItem(value: text),
                                  ),
                                ),
                            validator: (_) => state.phone.error,
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                91,
                                95,
                                92,
                              ),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              if (state.formKey!.currentState?.validate() ??
                                  false) {
                                context.read<ProfileUpdateBloc>().add(
                                  FormSubmit(),
                                );
                              }
                            },
                            icon: const Icon(Icons.save, color: Colors.white),
                            label: const Text(
                              "GUARDAR CAMBIOS",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botón de volver
          Positioned(top: 40, left: 16, child: DefaultIconBack()),

          // Título encima del degradado
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'PERFIL DE USUARIO',
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 204, 109),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GalleryOrPhotoDialog(
          context,
          () => context.read<ProfileUpdateBloc>().add(PickImage()),
          () => context.read<ProfileUpdateBloc>().add(TakePhoto()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: state.image != null
                  ? FileImage(state.image!)
                  : user?.image != null
                  ? NetworkImage(user!.image!) as ImageProvider
                  : const AssetImage('assets/img/user_image.png'),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Foto de perfil",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
