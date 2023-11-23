part of 'utils.dart';

Future<UserCredential> loginWithGoogle() async {
  final GoogleSignInAccount? user = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication authentication = await user!.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: authentication.accessToken, idToken: authentication.idToken);
  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  return userCredential;
}
