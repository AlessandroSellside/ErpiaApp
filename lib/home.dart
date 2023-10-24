
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'payment_config.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    paymentItems: const [
      PaymentItem(
        label: 'Item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price,
      )
    ],
    style: ApplePayButtonStyle.black,
    width: double.infinity,
    height: 50,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
        label: 'Total',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      )
    ],
    type: GooglePayButtonType.pay,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        shadowColor: Colors.black45,
        flexibleSpace: const Image(
          image: AssetImage('assets/banner.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/erpia.png'),
          ),
        ],
      ),
      body: Center(
        child: 
        SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to ERP.IA',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!,
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text('NC/DA'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Monto Total'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Razón Social del Emisor / Documento'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Estado Pagos'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Plazo'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Recepción SII'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Recepción FEBOS'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Emisión'),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                      DataCell(
                        Text('Test'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SignOutButton(),
            Center(child: GooglePayButton(
                paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: const [
                  PaymentItem(
                    label: 'Total',
                    amount: '0.01',
                    status: PaymentItemStatus.final_price,
                  )
                ],
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (result) => debugPrint('Payment Result $result'),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )),
          ],
        ),
      ),
      ),
      //Menú desplegable
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú'),
            ),
            const ListTile(
              leading: Icon(Icons.assured_workload_outlined),
              title: Text('Facturas'),
            ),
            const ListTile(
              leading: Icon(Icons.bakery_dining),
              title: Text('Bancos'),
            ),
            const ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Análisis'),
            ),
            const ListTile(
              leading: Icon(Icons.incomplete_circle_outlined),
              title: Text('Marketing'),
            ),
            const ListTile(
              leading: Icon(Icons.approval_outlined),
              title: Text('Aprobaciones'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute<ProfileScreen>(
                    builder: (context) => ProfileScreen(
                      appBar: AppBar(
                        title: const Text('User Profile'),
                        elevation: 15,
                      ),
                      actions: [
                        SignedOutAction((context) {
                          Navigator.of(context).pop();
                        })
                      ],
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              'assets/erpia.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/');
                } catch (e) {
                  print("Error al cerrar sesión: $e");
                }
              },
            )
          ],
        ),
      ),
    );
  }
  }



