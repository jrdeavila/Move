import 'package:mevo/lib.dart';
import 'package:get/get.dart';

class CancelReasonDialog extends StatefulWidget {
  final List<CancelReasonItem> reasons;
  const CancelReasonDialog({super.key, required this.reasons});

  @override
  State<CancelReasonDialog> createState() => _CancelReasonDialogState();
}

class _CancelReasonDialogState extends State<CancelReasonDialog> {
  CancelReasonItem? _reasonSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 16.0),
              const Icon(
                Icons.warning,
                color: Colors.red,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "¿Por qué deseas cancelar el servicio?",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Column(
                children: widget.reasons
                    .map(
                      (reason) => RadioListTile<CancelReasonItem>(
                        value: reason,
                        groupValue: _reasonSelected,
                        title: Text(reason.title),
                        onChanged: (value) {
                          setState(() {
                            _reasonSelected = value;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              ButtonClassic(
                text: "Cancelar",
                onPressed: () {
                  if (_reasonSelected == null) {
                    return;
                  }
                  Get.back(
                    result: _reasonSelected,
                  );
                },
                color: Colors.red,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CancelDialog extends StatelessWidget {
  const CancelDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 16.0),
              const Icon(
                Icons.warning,
                color: Colors.red,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "¿Estás seguro de cancelar el servicio?",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonClassic(
                        text: "No",
                        onPressed: () {
                          Get.back(result: false);
                        },
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ButtonClassic(
                      text: "Sí",
                      onPressed: () {
                        Get.back(result: true);
                      },
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
