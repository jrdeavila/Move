import 'package:mevo/lib.dart';

class TechnicalPreviewData extends GetView<TechnicalPreviewCtrl> {
  const TechnicalPreviewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final hasTPUploaded = controller.technicalPreviewUrl != null;
        var hasTPFile = controller.technicalPreviewFile != null;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Revisión técnico mecánica'),
            actions: [
              if (hasTPFile || hasTPUploaded)
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
          body: hasTPUploaded
              ? SfPdfViewer.network(controller.technicalPreviewUrl!)
              : hasTPFile
                  ? SfPdfViewer.file(controller.technicalPreviewFile!)
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonClassic(
                            text: "Subir Revisión técnico mecánica",
                            onPressed: () {
                              controller.loadFile();
                            },
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Debe subir un archivo PDF que contenga la información del documento de la revisión técnico mecánica.",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
          floatingActionButton: hasTPFile
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
