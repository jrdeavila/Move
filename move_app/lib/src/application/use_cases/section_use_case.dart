import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IConsultSectionsUseCase)
class ConsultSectionUseCase implements IConsultSectionsUseCase {
  final ISectionDataRepository _sectionDataRepository;

  ConsultSectionUseCase(this._sectionDataRepository);

  @override
  Future<Iterable<Section>> getSections() {
    return _sectionDataRepository.getSections();
  }
}

@Injectable(as: IConsultExtendedSectionUseCase)
class ConsultExtendedSectionUseCase implements IConsultExtendedSectionUseCase {
  final ISectionDataRepository _sectionDataRepository;

  ConsultExtendedSectionUseCase(this._sectionDataRepository);

  @override
  Future<ExtendedSection> getSection(Section section) {
    return _sectionDataRepository.getSection(section);
  }
}

@Injectable(as: INavigateToDashboardUseCase)
class NavigateToDashboardUseCase implements INavigateToDashboardUseCase {
  final ISectionDashboardService _showSectionDashboardService;

  NavigateToDashboardUseCase(this._showSectionDashboardService);
  @override
  void navigateToSubSection(SubSection subSection) {
    _showSectionDashboardService.showSectionDashboard(subSection);
  }
}
