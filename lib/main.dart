import 'package:flutter/material.dart';
import 'package:mparticle_flutter_sdk/events/event_type.dart';
import 'package:mparticle_flutter_sdk/events/mp_event.dart';
import 'package:mparticle_flutter_sdk/identity/identity_type.dart';
import 'package:mparticle_flutter_sdk/mparticle_flutter_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mParticle iOS Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Log Event Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                MparticleFlutterSdk? mpInstance =
                    await MparticleFlutterSdk.getInstance();
                final identityRequest = MparticleFlutterSdk.identityRequest;
                identityRequest.setIdentity(identityType: IdentityType.Email, value: 'anemailaddress@gmail.com');
                identityRequest.setIdentity(identityType: IdentityType.CustomerId, value: 'anemailaddress');
                mpInstance?.identity.login(identityRequest: identityRequest);
                mpInstance?.logEvent(MPEvent(eventName: 'Login successful', eventType: EventType.Other));
              },
              child: const Text('Log In'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                MparticleFlutterSdk? mpInstance = await MparticleFlutterSdk.getInstance();
                final identityRequest = MparticleFlutterSdk.identityRequest;
                identityRequest.setIdentity(identityType: IdentityType.Email, value: '');
                identityRequest.setIdentity(identityType: IdentityType.CustomerId, value: '');
                mpInstance?.identity.logout(identityRequest: identityRequest);
                mpInstance?.logEvent(MPEvent(
                    eventName: 'Logout', eventType: EventType.Other));
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
