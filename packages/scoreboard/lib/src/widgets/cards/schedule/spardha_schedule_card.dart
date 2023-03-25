import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../globals/enums.dart';
import '../../../stores/common_store.dart';
import '../../../models/spardha_models/spardha_event_model.dart';
import '../../../globals/colors.dart';
import '../popup_menu.dart';
import 'multiple_hostel_view.dart';
import '../card_event_details.dart';
import '../menu_item.dart';
import 'single_hostel_view.dart';
import 'time_venue_widget.dart';

class SpardhaScheduleCard extends StatefulWidget {
  final SpardhaEventModel eventModel;
  const SpardhaScheduleCard({super.key, required this.eventModel});

  @override
  State<SpardhaScheduleCard> createState() => _SpardhaScheduleCardState();
}

class _SpardhaScheduleCardState extends State<SpardhaScheduleCard> {
  List<PopupMenuEntry> popupOptions = [
    optionsMenuItem('Edit', 'edit schedule', Themes.kWhite),
    const PopupMenuDivider(
      height: 2,
    ),
    optionsMenuItem('Add result', 'add', Themes.primaryColor),
    const PopupMenuDivider(
      height: 2,
    ),
    optionsMenuItem('Delete', 'delete', Themes.errorRed),
  ];
  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: widget.eventModel.hostels.length == 11 ? 256 : 290),
          child: PopupMenu(
            eventModel: widget.eventModel,
            items: commonStore.viewType == ViewType.admin ? popupOptions : [],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Themes.cardColor2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardEventDetails(eventModel: widget.eventModel),
                    widget.eventModel.hostels.length > 2
                        ? MultipleHostelView(eventModel: widget.eventModel)
                        : BiHostelView(
                            hostelA: widget.eventModel.hostels[0],
                            hostelB: widget.eventModel.hostels[1],
                          ),
                    const SizedBox(
                      height: 32,
                    ),
                    TimeVenueWidget(eventModel: widget.eventModel),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
