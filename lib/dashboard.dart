import 'package:FieldApp/dash_view.dart';
import 'package:FieldApp/task_view.dart';
import 'package:flutter/material.dart';
import 'utils/themes/theme.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Container(

        padding: const EdgeInsets.all(12.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Kilimanjaro",style: TextStyle(fontSize: 10),),
//summary
            SizedBox(height: 5,),
            Container(
              child: Column(
                children: [

                  KpiTittle(
                    kpicolor: AppColor.mycolor,
                    label: 'Dashboard',
                    txtcolor: Colors.black87,
                  ),
                  KpiTittle(
                    kpicolor: Colors.black87,
                    label: 'Portfolio Quality / Collection Drive',
                    txtcolor: AppColor.mycolor,
                  ),

                  //Portfolio Quality

                  Row(children: [
                    RowData(
                      value: '25',
                      label: 'Score',
                    ),
                    RowData(
                      value: '45',
                      label: 'Repayment Speed',
                    ),
                    RowData(
                      value: '21',
                      label: 'At Risk Rate',
                    ),
                  ]),
                  const Divider(
                    height: 10,
                    thickness: 0,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      RowData(
                        value: '20',
                        label: 'Disabe Rate',
                      ),
                      RowData(
                        value: '20',
                        label: 'FSE Revamp',
                      ),
                      RowData(
                        value: '20',
                        label: 'Audity',
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 0,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  KpiTittle(
                    kpicolor:Colors.black87,
                    label: 'Customer Management',
                    txtcolor: AppColor.mycolor,
                  ),
                  Row(
                    children: [
                      RowData(
                        value: '10',
                        label: 'Fraud Case SLA',
                      ),
                      RowData(
                        value: '40',
                        label: 'CC Escalation',
                      ),
                      RowData(
                        value: '50',
                        label: 'Replacement SLA',
                      ),
                      RowData(
                        value: '90',
                        label: 'Change of Details',
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 0,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  KpiTittle(
                    kpicolor: Colors.black87,
                    label: 'Pilot / Process Management',
                    txtcolor: AppColor.mycolor,
                  ),
                  Row(
                    children: [
                      RowData(
                        value: '10',
                        label: 'Agent Restriction',
                      ),
                      RowData(
                        value: '132',
                        label: 'Audit Reports',
                      ),
                      RowData(
                        value: '132',
                        label: 'Repossession Rate',
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 0,
                    color: Colors.black,
                  ),
                  KpiTittle(
                    kpicolor: Colors.black87,
                    label: 'Team Management',
                    txtcolor: AppColor.mycolor,
                  ),
                  Row(
                    children: [
                      RowData(
                        value: '10',
                        label: '',
                      ),
                      RowData(
                        value: '10',
                        label: 'Replacement SLA',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  final value;
  final String label;

  const RowData({Key? key, required this.value, required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashView(),
              ));

        },
        child: Card(
          elevation: 8,
          child: Container(
            height: 50,
            width: 50,
            child: Column(
                children: [
                  Text(value, style: TextStyle(fontSize: 30,)),
                  Text(label, style: TextStyle(fontSize: 9))
                ],
              ),
          ),
        ),
      ),
    );
  }
}

class KpiTittle extends StatelessWidget {
  final Color kpicolor;
  final String label;
  final Color txtcolor;
  const KpiTittle({Key? key, required this.kpicolor, required this.txtcolor,required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.amber,
      color: kpicolor,
      child: ListTile(
        title: Center(child: Text(label, style: TextStyle(fontSize: 20,color: txtcolor))),
        dense: true,
      ),
    );
  }
}
