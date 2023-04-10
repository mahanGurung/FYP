import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:final_year_project/controllers/doctor_controller.dart';
import 'package:final_year_project/models/doctor.dart';

import '../pages/doctor.dart';
import '../utils/api.dart';

class DoctorTile extends StatelessWidget {
  final DoctorController? dc;
  final Doctor d;
  final bool isAdmin;
  const DoctorTile({super.key, required this.d, this.dc, this.isAdmin = true});

  @override
  Widget build(BuildContext context) {
    return (isAdmin || d.approved == '1')
        ? InkWell(
            onTap: (() => Get.to(() => AdminProductPage(
                  doctor: d,
                ))),
            child: Container(
              width: Get.width / 2,
              height: (Get.width / 2) + 50,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(color: Colors.black, width: 0.5),
                    boxShadow: [BoxShadow()],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: 'image_' + d.image!,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      baseUrl + d.image!,
                                    )),
                                boxShadow: [BoxShadow()]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(d.description!),
                              Text("Price: " + d.price.toString()),
                              if (isAdmin)
                                ToggleSwitch(
                                  minWidth: 80.0,
                                  cornerRadius: 20.0,
                                  activeBgColors: [
                                    [Colors.green[800]!],
                                    [Colors.red[800]!]
                                  ],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: d.approved == '1' ? 0 : 1,
                                  totalSwitches: 2,
                                  labels: const ['Approve', 'Reject'],
                                  radiusStyle: true,
                                  onToggle: (index) {
                                    var data = {
                                      'Id': d.id,
                                      'approved': d.approved == '1' ? '0' : '1'
                                    };
                                    dc!.toggle(data: data);
                                  },
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
