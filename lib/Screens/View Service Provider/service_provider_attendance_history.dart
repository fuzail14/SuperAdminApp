import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class ServiceProviderAttendanceHistory extends StatefulWidget {
  const ServiceProviderAttendanceHistory({Key? key}) : super(key: key);

  @override
  State<ServiceProviderAttendanceHistory> createState() => _ServiceProviderAttendanceHistoryState();
}

class _ServiceProviderAttendanceHistoryState extends State<ServiceProviderAttendanceHistory> {
  @override
  Widget build(BuildContext context) {
    return     Scaffold(appBar: AppBar(backgroundColor: primaryColor,
      title: Text('Provider Check In/Out History'),centerTitle: true,),
        body: ListView(
          children: [
            _createDataTable()
          ],)
    );
  }
  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Date')),
      DataColumn(label: Expanded(child: Text('Check In Time'))),
      DataColumn(label: Expanded(
        child: Text(
            'Check Out Time'),
      ))
    ];
  }
  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('13-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('14-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('15-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('16-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('17-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('18-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('19-8-2022')),
        DataCell(Text('9:00 am')),
        DataCell(Text('7:00 pm'))
      ]),

    ];
  }
}
