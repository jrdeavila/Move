import 'package:move_app/lib.dart';

class SoatData extends GetView<SoatCtrl> {
  const SoatData({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final hasSoatUploaded = controller.soatFileUrl != null;
        var hasSoatFile = controller.soatFile != null;
        return Scaffold(
          appBar: AppBar(
            title: const Text('SOAT'),
            actions: [
              if (hasSoatFile || hasSoatUploaded)
                IconButton(
                  onPressed: () {
                    controller.clearFiles();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
            ],
          ),
          body: hasSoatUploaded
              ? SfPdfViewer.network(controller.soatFileUrl!)
              : hasSoatFile
                  ? SfPdfViewer.file(controller.soatFile!)
                  : Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ButtonClassic(
                          text: "Subir SOAT",
                          onPressed: () {
                            controller.loadFile();
                          },
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Debe subir un archivo PDF que contenga la información del SOAT actualizado",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
          floatingActionButton: hasSoatFile
              ? FloatingActionButton.extended(
                  onPressed: () {
                    controller.save();
                  },
                  icon: controller.isLoading
                      ? const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.save, color: Colors.white),
                  label: controller.isLoading
                      ? const Text("Guardando...",
                          style: TextStyle(color: Colors.white))
                      : const Text(
                          "Guardar",
                          style: TextStyle(color: Colors.white),
                        ))
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
