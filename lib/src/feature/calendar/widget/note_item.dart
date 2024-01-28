import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/model/note/note.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/datetime_ext.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/calendar/month_calendar.dart';

class XNoteItem extends StatefulWidget {
  const XNoteItem({super.key, required this.note, required this.deleteFunc});
  final MNote note;
  final Function deleteFunc;

  @override
  State<XNoteItem> createState() => _XNoteItemState();
}

class _XNoteItemState extends State<XNoteItem> {
  late NoteType _type;
  late bool _isExpand;

  @override
  void initState() {
    super.initState();
    _isExpand = false;
    _type = NoteType.toNoteTypeEnum(widget.note.type);
  }

  @override
  void didUpdateWidget(covariant XNoteItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _type = NoteType.toNoteTypeEnum(widget.note.type);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _renderHeaderNote(),
        _renderBodyNote(),
      ],
    );
  }

  Widget _renderHeaderNote() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _renderDotColor(),
        _renderTitle(),
        _renderExpandedButton(),
      ],
    );
  }

  Widget _renderDotColor() {
    return Container(
      height: AppSize.s10,
      width: AppSize.s10,
      decoration: BoxDecoration(
        color: _type.noteColors(),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.r5),
        ),
      ),
    );
  }

  Widget _renderTitle() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: Text(
        widget.note.title,
        style: const TextStyle(
            fontFamily: FontFamily.abel, fontWeight: FontWeight.bold),
      ),
    ));
  }

  Widget _renderExpandedButton() {
    return IconButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          setState(() {
            _isExpand = !_isExpand;
          });
        },
        icon: Icon(
          _isExpand ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp,
          color: AppColors.primary,
        ));
  }

  Widget _renderBodyNote() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      color: AppColors.grey7,
      child: _isExpand
          ? switch (_type) {
              NoteType.appointment => _renderAppointmentBody(),
              NoteType.reminder => _renderReminderBody(),
              NoteType.other => _renderOtherBody(),
              _ => const SizedBox.shrink(),
            }
          : const SizedBox.shrink(),
    );
  }

  Widget _renderAppointmentBody() {
    return Center(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        XPaddingUtils.horizontalPadding(width: AppPadding.p15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.detail ?? '',
                style: const TextStyle(
                    fontFamily: FontFamily.abel,
                    color: AppColors.hintTextColor),
              ),
              XPaddingUtils.verticalPadding(height: AppPadding.p8),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    S.of(context).time,
                    style: const TextStyle(fontFamily: FontFamily.abel),
                  ),
                  Text(
                    (widget.note.time ?? DateTime.now()).toHHmm,
                    style: const TextStyle(
                        fontFamily: FontFamily.abel,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).hospital,
                    style: const TextStyle(fontFamily: FontFamily.abel),
                  ),
                  Text(
                    widget.note.hospital ?? '',
                    style: const TextStyle(
                        fontFamily: FontFamily.abel,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        _renderDeleteIcon(),
      ],
    ));
  }

  Widget _renderReminderBody() {
    return Center(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        XPaddingUtils.horizontalPadding(width: AppPadding.p15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.detail ?? '',
                style: const TextStyle(
                    fontFamily: FontFamily.abel,
                    color: AppColors.hintTextColor),
              ),
              XPaddingUtils.verticalPadding(height: AppPadding.p8),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    S.of(context).time,
                    style: const TextStyle(fontFamily: FontFamily.abel),
                  ),
                  Text(
                    (widget.note.time ?? DateTime.now()).toHHmm,
                    style: const TextStyle(
                        fontFamily: FontFamily.abel,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).medicine,
                    style: const TextStyle(fontFamily: FontFamily.abel),
                  ),
                  Text(
                    widget.note.medicine ?? '',
                    style: const TextStyle(
                        fontFamily: FontFamily.abel,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        _renderDeleteIcon(),
      ],
    ));
  }

  Widget _renderOtherBody() {
    return Center(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        XPaddingUtils.horizontalPadding(width: AppPadding.p15),
        Expanded(
          child: Text(
            widget.note.detail ?? '',
            style: const TextStyle(
                fontFamily: FontFamily.abel, color: AppColors.hintTextColor),
          ),
        ),
        _renderDeleteIcon(),
      ],
    ));
  }

  Widget _renderDeleteIcon() {
    return IconButton(
        onPressed: () {
          widget.deleteFunc();
        },
        icon: const Icon(
          Icons.delete_forever,
          color: AppColors.red,
          size: AppSize.s20,
        ));
  }
}
