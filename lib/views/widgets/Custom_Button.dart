import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/Constans.dart';

class CustomBotton extends StatelessWidget {
 const  CustomBotton({super.key, this.onTap,  this.isLoading = false});

final bool isLoading; 
final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: isLoading ? const  SizedBox(
            height: 25 ,
            width: 25,
            
              child:  CircularProgressIndicator( color: Colors.black,)) : const Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
