import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:pca_web/providers/providers.dart';
import 'package:pca_web/theme/my_colors.dart';
import 'package:pca_web/tools/tools.dart';
import 'package:pca_web/widgets/widgets.dart';

class DigitalSignatureView extends StatelessWidget {
  const DigitalSignatureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DigitalSignatureProvider()),
      ],
      child: const _DigitalSignatureView(),
    );
  }
}

class _DigitalSignatureView extends StatelessWidget {
  const _DigitalSignatureView();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DigitalSignatureProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (value) =>
            provider.controller = provider.controller,
        onHorizontalDragEnd: (value) =>
            provider.controller = provider.controller,
        onVerticalDragStart: (value) =>
            provider.controller = provider.controller,
        onVerticalDragEnd: (value) => provider.controller = provider.controller,
        onHorizontalDragUpdate: (value) =>
            provider.controller = provider.controller,
        onVerticalDragUpdate: (value) =>
            provider.controller = provider.controller,
        onHorizontalDragDown: (value) =>
            provider.controller = provider.controller,
        onVerticalDragDown: (value) =>
            provider.controller = provider.controller,
        onHorizontalDragCancel: () => provider.controller = provider.controller,
        onVerticalDragCancel: () => provider.controller = provider.controller,
        child: Center(
          child: Container(
            height: size.height * 1,
            width: size.width * 1,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: !provider.isLoading && provider.isSigned
                ? _SeeSignature(provider: provider)
                : !provider.isLoading && !provider.isSigned
                    ? _Sign(provider: provider)
                    : const _LoadingSignature(),
          ),
        ),
      ),
    );
  }
}

class _LoadingSignature extends StatelessWidget {
  const _LoadingSignature();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CupertinoActivityIndicator(
          radius: 20,
        ),
        SizedBox(height: 11),
        Text(
          'Cargando',
          style: TextStyle(
            fontFamily: fontFamily,
          ),
        ),
      ],
    );
  }
}

class _Sign extends StatelessWidget {
  final DigitalSignatureProvider provider;
  const _Sign({
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Signature(
          backgroundColor: MyColors.onBackground,
          controller: provider.controller,
          height: size.height * .65,
          width: size.width * .7,
        ),
        SizedBox(height: size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainButtonWidget(
              borderRadius: 16,
              buttonColor: MyColors.secondary,
              onPressed: () => provider.controller.clear(),
              child: Row(
                children: [
                  const Text(
                    'Intentar de nuevo',
                    style: TextStyle(
                      color: Color(0XFF00344C),
                      fontFamily: fontFamily,
                    ),
                  ),
                  const SizedBox(width: 11),
                  SvgPicture.asset(
                    IconsSvgRoutes.reload,
                    color: Color(0XFF00344C),
                  ),
                ],
              ),
            ),
            MainButtonWidget(
              borderRadius: 16,
              buttonColor: MyColors.surfaceTint,
              onPressed: provider.isLoading || provider.controller.isEmpty
                  ? null
                  : () async {
                      provider.showSigned = await provider.exportSignature(
                        bckColor: Colors.white,
                      );
                      provider.signature = await provider.exportSignature();
                      provider.isSigned = true;
                    },
              child: Row(
                children: [
                  const Text(
                    'Aceptar',
                    style: TextStyle(
                      fontFamily: fontFamily,
                    ),
                  ),
                  const SizedBox(width: 11),
                  SvgPicture.asset(
                    IconsSvgRoutes.circleCheck3,
                    color: provider.controller.isEmpty
                        ? MyColors.iQGris1
                        : Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SeeSignature extends StatelessWidget {
  final DigitalSignatureProvider provider;
  const _SeeSignature({
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextRichWith3Widget(
            text1:
                'La siguiente firma será cargada en sistema para su utilización en las diferentes acciones dentro del sistema. ',
            text2: '¿Estás seguro de guardar esta firma?',
          ),
          const SizedBox(height: 44),
          Image.memory(
            provider.showSigned!,
            scale: 1,
          ),
          const SizedBox(height: 128),
          MainButtonWidget(
            height: 35,
            width: 328,
            borderColor: MyColors.primary,
            buttonColor: Colors.transparent,
            child: const Text(
              'Intentar de nuevo',
              style: TextStyle(
                color: MyColors.primary,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () => provider.isSigned = false,
          ),
          const SizedBox(height: 30),
          MainButtonWidget(
            width: 328,
            child: const Text(
              'Guardar',
              style: TextStyle(
                color: Color(0XFF00382B),
                fontFamily: fontFamily,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              provider.isLoading = true;
              print("img: ${provider.signature}");
              await Future.delayed(Duration(seconds: 3));
              provider.isLoading = false;
            },
          ),
        ],
      ),
    );
  }
}
