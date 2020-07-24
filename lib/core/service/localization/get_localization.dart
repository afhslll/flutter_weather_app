import 'localization_service.dart';

class GetLocalization {
  String get noSlotMsg => localizationService.text('no_slot_msg');
}

GetLocalization getLocalization = GetLocalization();
