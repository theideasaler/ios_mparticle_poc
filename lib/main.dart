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
                final user = await mpInstance?.getCurrentUser();
                user?.setUserAttribute(key: '\$Zip', value: '2023');
                user?.setUserAttribute(key: 'attr1', value: '20230810.24157');
                user?.setUserAttribute(key: 'attr2', value: 'true');
                user?.setUserAttribute(key: 'attr3', value: 'hello world');
                mpInstance?.logEvent(MPEvent(eventName: 'Login successful', eventType: EventType.Other));
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 20),
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
