import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/decorations.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/datetime_ext.dart';
import 'package:safebump/src/utils/datetime_utils.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/fill_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

enum CalendarState { normal, loading, error }

enum NoteType {
  other,
  appointment,
  reminder,
  none;

  Color noteColors() {
    switch (this) {
      case NoteType.appointment:
        return AppColors.primary;
      case NoteType.other:
        return AppColors.grey;
      case NoteType.reminder:
        return AppColors.green;
      default:
        return Colors.transparent;
    }
  }
}

class XMonthCalendar extends StatefulWidget {
  final DateTime? selectingDay;
  final List<DateTime> data;
  final ValueChanged<DateTime> onDaySelected;
  final DateTime minDate;
  final DateTime? maxDate;
  final CalendarState calendarState;
  final List<NoteType>? listNoteType;
  const XMonthCalendar({
    Key? key,
    this.selectingDay,
    required this.data,
    required this.onDaySelected,
    required this.minDate,
    this.maxDate,
    this.calendarState = CalendarState.normal,
    this.listNoteType,
  }) : super(key: key);

  @override
  State<XMonthCalendar> createState() => _XMonthCalendarState();
}

class _XMonthCalendarState extends State<XMonthCalendar> {
  final double _calendarHeight = 350;
  var _isMinMonth = false;
  var _isMaxMonth = false;

  late DateTime _selectingDay;
  late DateTime _selectingMonth;
  late CalendarController _controller;
  late DateTime _maxDate;

  @override
  void initState() {
    _selectingDay = widget.selectingDay ?? DateTime.now();
    _selectingMonth = _selectingDay;
    _controller = CalendarController();
    _maxDate = widget.maxDate ?? DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChangeDay(DateTime date) {
    setState(() {
      _selectingDay = DateTime(
        date.year,
        date.month,
        date.day,
        _selectingDay.hour,
        _selectingDay.minute,
      );
    });
  }

  void _onChangeMonth(DateTime date) {
    _validateMonth(date);
    setState(() {
      _selectingMonth = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: switch (widget.calendarState) {
        CalendarState.loading => [_renderLoadingView()],
        CalendarState.error => [_renderTryAgainView()],
        CalendarState.normal => [_renderCalendarView()],
      },
    );
  }

  Widget _renderLoadingView() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          boxShadow: AppDecorations.shadow,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r10)),
      child: Center(
        child: Transform.scale(
          scale: 0.4,
          child: Assets.jsons.syncData.lottie(fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

  Widget _renderTryAgainView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Assets.svg.errorInCalendar.svg(height: AppSize.s200),
        XPaddingUtils.verticalPadding(height: AppPadding.p23),
        Text(
          S.of(context).someThingWentWrong,
          style: const TextStyle(
              color: AppColors.hintTextColor,
              fontSize: AppFontSize.f16,
              fontFamily: FontFamily.inter),
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: XFillButton(
            label: Text(
              S.of(context).tryAgain,
              style: const TextStyle(
                  color: AppColors.white,
                  fontFamily: FontFamily.productSans,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderCalendarView() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          boxShadow: AppDecorations.shadow,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_renderCalendarHeader(), _renderCalendarBody()],
      ),
    );
  }

  Widget _renderCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: AppMargin.m20),
          child: IconButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.r10)),
                  side: BorderSide(color: AppColors.grey5, width: AppSize.s2),
                ),
              ),
            ),
            onPressed: _isMinMonth ? null : () => _controller.backward?.call(),
            icon: const Icon(
              Icons.arrow_back,
              size: AppSize.s20,
            ),
          ),
        ),
        Text(
          _selectingMonth.toMMMdy,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: AppFontSize.f20,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.abel,
            color: AppColors.primary,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: AppMargin.m20),
          child: IconButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.r10)),
                  side: BorderSide(color: AppColors.grey5, width: AppSize.s2),
                ),
              ),
            ),
            onPressed: _isMaxMonth ? null : () => _controller.forward?.call(),
            icon: const Icon(
              Icons.arrow_forward,
              size: AppSize.s20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderCalendarBody() {
    return SizedBox(
      // Fixed height prevent RenderFlex overflow in SfCalendar
      height: _calendarHeight,
      child: SfCalendar(
        controller: _controller,
        onSelectionChanged: (calendarSelectionDetails) {
          _onChangeDay(calendarSelectionDetails.date ?? DateTime.now());
        },
        monthCellBuilder: (context, details) => _renderMonthCell(details.date),
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.transparent),
        ),
        firstDayOfWeek: 7,
        view: CalendarView.month,
        monthViewSettings: const MonthViewSettings(
          navigationDirection: MonthNavigationDirection.horizontal,
          showTrailingAndLeadingDates: false,
        ),
        viewHeaderStyle: const ViewHeaderStyle(
          dayTextStyle: TextStyle(
              fontSize: AppFontSize.f16,
              fontWeight: FontWeight.bold,
              fontFamily: FontFamily.abel,
              color: AppColors.hintTextColor),
        ),
        // Hide default header, use the _renderCalendarHeader()
        headerHeight: 0,
        maxDate: _maxDate,
        minDate: widget.minDate,
        initialDisplayDate: widget.selectingDay,
        onViewChanged: (viewChangedDetails) async {
          // Work around: Wait for SfCalendar widget done rebuild internally.
          await Future.delayed(const Duration(milliseconds: 50));
          final firstDayOfMonth = viewChangedDetails.visibleDates.first;
          _onChangeMonth(firstDayOfMonth);
        },
      ),
    );
  }

  Widget _renderMonthCell(DateTime date) {
    final isCellEnabled = _isValidDay(date);
    final itemIndex = widget.data.indexWhere((element) {
      return DateUtils.isSameDay(element, date);
    });
    final hasNote = itemIndex != -1;
    return Opacity(
      opacity: isCellEnabled ? 1 : 0.3,
      child: Column(
        children: [
          _renderCustomDateCell(date),
          _renderDotIndicator(hasNote, isCellEnabled),
        ],
      ),
    );
  }

  Widget _renderCustomDateCell(DateTime date) {
    return Container(
      height: AppSize.s30,
      width: AppSize.s30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: DateTimeUtils.isSameDay(date, _selectingDay)
            ? AppColors.subPrimary
            : Colors.transparent,
        border: Border.all(
          color: DateTimeUtils.isSameDay(date, _selectingDay)
              ? AppColors.primary
              : Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.r10),
        ),
      ),
      child: Text(
        date.day.toString(),
        style: DateTimeUtils.isSameDay(date, _selectingDay)
            ? const TextStyle(
                color: AppColors.primary,
                fontSize: AppFontSize.f14,
                fontWeight: FontWeight.bold,
              )
            : const TextStyle(
                color: AppColors.hintTextColor,
                fontSize: AppFontSize.f14,
              ),
      ),
    );
  }

  Widget _renderDotIndicator(bool hasBioheartData, bool isEnable) {
    if (!isEnable) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (NoteType type in widget.listNoteType ?? [])
          Container(
            margin: const EdgeInsets.only(top: AppMargin.m8),
            height: AppSize.s8,
            width: AppSize.s8,
            decoration: BoxDecoration(
              color: type.noteColors(),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppRadius.r4),
              ),
            ),
          ),
      ],
    );
  }

  // Days mustn't be future day & before account creation day.
  bool _isValidDay(DateTime time) {
    final now = DateTime.now();
    final currentDate = DateTime(now.year, now.month, now.day);
    if (time.difference(currentDate).inDays > 0 ||
        time.difference(widget.minDate).inDays < 0) {
      return false;
    }

    return true;
  }

  void _validateMonth(DateTime time) {
    if (time.year == _maxDate.year && time.month == _maxDate.month) {
      _isMaxMonth = true;
    } else {
      _isMaxMonth = false;
    }

    if (time.year == widget.minDate.year &&
        time.month == widget.minDate.month) {
      _isMinMonth = true;
    } else {
      _isMinMonth = false;
    }
  }
}
