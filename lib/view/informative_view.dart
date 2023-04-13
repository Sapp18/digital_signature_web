import 'package:flutter/material.dart';
import 'package:pca_web/tools/tools.dart';

class LinkNotFoundView extends StatelessWidget {
  const LinkNotFoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return const _InfoWidget(
      img: 'assets/images/search_off.png',
      title: 'Link de carga de firma no encontrado',
      subtitle:
          'El link cargado es incorrecto o no existe. Por favor, contacta a tu asesor para que te proporcione uno correcto.',
    );
  }
}

class AnErrorOcurredView extends StatelessWidget {
  const AnErrorOcurredView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _InfoWidget(
      img: 'assets/images/warning.png',
      title: '¡Ocurrió un error! envio de firma incorrecto',
      subtitle:
          'Ocurrio un error al momento de cargar y guardar el registro. Por favor, ponte en contacto con tu ejecutivo y pide un nuevo link de carga de firma digital.',
    );
  }
}

class SignatureSentView extends StatelessWidget {
  const SignatureSentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _InfoWidget(
      img: 'assets/images/verified.png',
      title: 'Firma enviada correctamente',
      subtitle:
          'Registro guardado de manera correcta. Ponte en contacto con nuestro asesor para darle seguimiento a tu caso. De requerirlo, se te solicitará volver a cargar tu firma.',
    );
  }
}

class _InfoWidget extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  const _InfoWidget({
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                scale: 2,
              ),
              const SizedBox(height: 26),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
