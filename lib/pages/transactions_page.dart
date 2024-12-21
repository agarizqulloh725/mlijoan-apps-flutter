import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() =>
      _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        top: true,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(1, (index) => const Padding(
                padding: EdgeInsets.only(top: 15),
                child: TransactionListItem(),
              )),
            ),
        ),
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        10.0, 0.0, 10.0, 0.0),
      child: Container(
        width: 100.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
                7.0, 6.0, 7.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 36.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 137.0,
                          height: 100.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                  Icons.shopping_bag,
                                  color: Color(0xFF000000),
                                  size: 24.0,
                                ),
                              Container(
                                width: 95.0,
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(),
                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                      child: const Text(
                                        'Belanja',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF000000)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: const Text(
                                        '30 September 2024',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          letterSpacing: 0.0,
                                          color: Color(0xFFAAAAAA)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 20.0,
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0x8239D2C0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const IntrinsicWidth(
                                  child: Center(
                                    child: Text(
                                      'Selesai',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF057F43),
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.more_vert,
                                color: Color(0xFF000000),
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 5.0, 0.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFAAAAAA),
                      border: Border.all(
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            'https://picsum.photos/seed/853/600',
                            width: 54.0, 
                            height: 47.0,  
                            fit: BoxFit.cover,
                          ),
                        ),

                        Expanded(  
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sayur Bayam ',
                                  style: TextStyle(
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,  
                                  maxLines: 1,  
                                ),
                                Text(
                                  '100 barang',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: 39.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Text(
                                  'Total Belanja',
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rp',
                                      style: TextStyle(
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '12.500.000',
                                      style: TextStyle(
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 93.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.teal,
                                  ),
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Ulasan',
                                    style: TextStyle(
                                      color: Colors.teal,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 93.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Beli Lagi',
                                    style: TextStyle(
                                      color: Color(0xFFEDEDED),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
