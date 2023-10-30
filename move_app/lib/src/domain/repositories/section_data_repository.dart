import 'package:move_app/lib.dart';

abstract class ISectionDataRepository {
  Future<Iterable<Section>> getSections();

  Future<ExtendedSection> getSection(Section section);
}
