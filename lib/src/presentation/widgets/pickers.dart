import 'package:mevo/lib.dart';

class ImagePicker extends StatefulWidget {
  final void Function(Uint8List? image)? onImageSelected;
  final Widget? Function(Uint8List? image, Widget? child)? childOnImageSelected;
  final Uint8List? image;
  final double? margin;
  final Widget? child;
  final bool canRemove;

  const ImagePicker({
    super.key,
    this.onImageSelected,
    this.childOnImageSelected,
    this.image,
    this.margin,
    this.canRemove = true,
    this.child,
  });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  Uint8List? _image;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    final image = _image ?? widget.image;
    final hasImage = image != null;
    return Container(
      margin: EdgeInsets.all(widget.margin ?? 5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTapUp: _showMenu,
        onTap: () {},
        child: widget.childOnImageSelected?.call(_image, widget.child) ??
            widget.child ??
            Ink(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
                border: hasImage
                    ? Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                image: hasImage
                    ? DecorationImage(
                        image: MemoryImage(image),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: hasImage
                  ? null
                  : Icon(
                      Icons.add_a_photo,
                      color: Theme.of(context).colorScheme.primary,
                      size: 40.0,
                    ),
            ),
      ),
    );
  }

  void _showMenu(TapUpDetails details) {
    dialogBuilder<ResultImagePicker>(
        context,
        details.globalPosition,
        SelectImageMenu(
          canRemove: widget.canRemove,
        )).then((value) {
      if (value is ResultImagePicker) {
        if (value.remove) {
          setState(() {
            _image = null;
          });
        } else {
          setState(() {
            _image = value.image;
          });
        }
      }
      widget.onImageSelected?.call(_image);
    });
  }
}

class SelectImageMenu extends StatelessWidget {
  final bool canRemove;
  const SelectImageMenu({super.key, required this.canRemove});

  @override
  Widget build(BuildContext context) {
    var foregroundColor = Theme.of(context).colorScheme.primary;
    return SelectMenu(backgroundColor: Colors.white, children: [
      MenuAction(
          icon: Icons.image,
          text: "Galeria",
          foregroundColor: foregroundColor,
          onTap: () {
            PickImageUtility.pickImage().then((value) {
              Navigator.of(context).pop(ResultImagePicker(
                image: value,
              ));
            });
          }),
      MenuAction(
        icon: Icons.camera_alt,
        text: "Tomar foto",
        foregroundColor: foregroundColor,
        onTap: () {
          PickImageUtility.takePhoto().then((value) {
            Navigator.of(context).pop(ResultImagePicker(
              image: value,
            ));
          });
        },
      ),
      if (canRemove)
        MenuAction(
          icon: Icons.delete,
          text: "Quitar imagen",
          foregroundColor: foregroundColor,
          onTap: () {
            Navigator.of(context).pop(ResultImagePicker(remove: true));
          },
        ),
    ]);
  }
}

class ResultImagePicker {
  final bool remove;
  final Uint8List? image;
  ResultImagePicker({this.remove = false, this.image});
}

class SelectMenu extends StatelessWidget {
  final List<MenuAction> children;
  final Color backgroundColor;
  const SelectMenu({
    super.key,
    required this.children,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .2,
      child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          )),
    );
  }
}

class MenuAction extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String text;
  final Color foregroundColor;
  const MenuAction({
    Key? key,
    this.onTap,
    required this.icon,
    required this.text,
    this.foregroundColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: foregroundColor),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: foregroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
