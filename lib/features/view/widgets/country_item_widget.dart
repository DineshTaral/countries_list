import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryItemWidget extends StatelessWidget {
  final String? name, flag;

  const CountryItemWidget({required this.name, required this.flag, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(flag==null||flag=="")
           const SizedBox(
              child: Text("Image Not Available"),
            )
          else
          Image.network(
            flag ?? '',
            height: 100.w,
            width: 150.w,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.w,),
          Expanded(child: Text(name ?? '',style: TextStyle(color: Colors.white,fontSize: 16.sp),))
        ],
      ),
    );
  }
}
