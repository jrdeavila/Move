import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mevo/lib.dart';

class QualificationDialog extends StatefulWidget {
  const QualificationDialog({
    super.key,
  });

  @override
  State<QualificationDialog> createState() => _QualificationDialogState();
}

class _QualificationDialogState extends State<QualificationDialog> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Material(
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Califica el servicio",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 50,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      _rating = rating;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  ButtonClassic(
                    onPressed: () {
                      if (_rating == 0) {
                        return;
                      }
                      Get.back(
                        result: _rating,
                      );
                    },
                    text: "Calificar",
                    color: Colors.blue,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
