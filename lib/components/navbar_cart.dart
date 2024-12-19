import 'package:flutter/material.dart';

class NavbarCart extends StatelessWidget {
  const NavbarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: const Color.fromARGB(255, 255, 255, 255), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? value) {},
                activeColor: Colors.white, 
                checkColor: Colors.teal, 
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Text('Semua', style: TextStyle(fontSize: 14.0, color: Colors.black)),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total:', style: TextStyle(
                fontSize: 12.0, color: Colors.black,)
                ),
              Row(
                children: [
                  Text('Rp. ', style: TextStyle(
                    fontSize: 14.0, color: Colors.black, 
                    fontWeight: FontWeight.w700)),
                  Text('4.000.000', style: TextStyle(
                    fontSize: 14.0, color: Colors.black,
                    fontWeight: FontWeight.w700,
                    )),
                ],
              ),
            ],
          ),
        Container(
          width: 120,
          height: MediaQuery.of(context).size.height, 
          color: Colors.teal,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Beli', style: TextStyle(
                fontSize: 16.0, 
                color: Colors.white,
                fontWeight: FontWeight.w800,
              )),
              Text(' (', style: TextStyle(
                fontSize: 16.0, 
                color: Colors.white,
                fontWeight: FontWeight.w800,
              )),
              Text('10', style: TextStyle(
                fontSize: 16.0, 
                color: Colors.white,
                fontWeight: FontWeight.w800,
              )),
              Text(')', style: TextStyle(
                fontSize: 16.0, 
                color: Colors.white,
                fontWeight: FontWeight.w800,
              )),
            ],
          ),
        )
        ],
      ),
    );
  }
}