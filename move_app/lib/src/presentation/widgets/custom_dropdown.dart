import 'package:move_app/lib.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;
  const CustomDropdown({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.01),
      child: Container(
        width: Dimensions.screenWidth * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton<String>(
          value: selectedOption,
          onChanged: onChanged,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
            size: Dimensions.screenWidth * 0.06,
          ),
          isExpanded: true,
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.06),
                child: Text(
                  value,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.04,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
