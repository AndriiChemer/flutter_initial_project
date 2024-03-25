import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/page/add_event_calendar/event_list_page.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';

class AddEventCalendarPage extends HookWidget {
  const AddEventCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarPlugin = useMemoized(() => CalendarPlugin());

    Widget _futureBuilder = FutureBuilder<List<Calendar>?>(
      future: _fetchCalendars(calendarPlugin),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        List<Calendar> calendars = snapshot.data!;

        return ListView.builder(

            shrinkWrap: true,
            itemCount: calendars.length,
            itemBuilder: (context, index) {
              Calendar calendar = calendars[index];
              return ListTile(
                title: Text(calendar.name!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('accountName: ${calendar.accountName ?? '-'}'),
                    Text('ownerName: ${calendar.ownerName ?? '-'}'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EventListPage(calendarId: calendar.id!);
                      },
                    ),
                  );
                },
              );
            });
      },
    );


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Calendars List',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          _futureBuilder,
        ],
      ),
    );
  }

  Future<List<Calendar>?> _fetchCalendars(CalendarPlugin calendarPlugin) async {
    await calendarPlugin.hasPermissions().then((value) async {
      print('ANDRII calendarPlugin hasPermission: $value');
      if (!value!) {
        await calendarPlugin.requestPermissions();
      }
    });

    return calendarPlugin.getCalendars();
  }
}
