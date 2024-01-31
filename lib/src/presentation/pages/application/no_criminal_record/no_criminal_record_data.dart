import 'package:mevo/lib.dart';

class NoCriminalRecordData extends GetView<NoCriminalRecordCtrl> {
  const NoCriminalRecordData({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final hasTPUploaded = controller.noCriminalRecordUrl != null;
        var hasTPFile = controller.noCriminalRecordFile != null;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Antecedentes Penales'),
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
              ? SfPdfViewer.network(controller.noCriminalRecordUrl!)
              : hasTPFile
                  ? SfPdfViewer.file(controller.noCriminalRecordFile!)
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonClassic(
                            text: "Subir Carta de Antecedentes",
                            onPressed: () {
                              controller.loadFile();
                            },
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Debe subir un archivo PDF que contenga la información de la carta de antecedentes penales.",
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
