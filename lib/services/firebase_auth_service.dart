import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 현재 로그인한 사용자 가져오기
  User? get currentUser => _auth.currentUser;

  // 사용자 인증 상태 스트림
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 이메일/비밀번호로 회원가입
  Future<UserCredential> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // 1. Firebase Auth로 사용자 생성
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. 사용자 프로필 업데이트 (이름 설정)
      await userCredential.user?.updateDisplayName(name);

      // 3. Firestore에 사용자 정보 저장
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'lastLogin': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  // 이메일/비밀번호로 로그인
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 로그인 시간 업데이트
      await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .update({
        'lastLogin': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // 회원 탈퇴
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Firestore에서 사용자 데이터 삭제
      await _firestore.collection('users').doc(user.uid).delete();
      // Firebase Auth에서 사용자 삭제
      await user.delete();
    }
  }

  // 비밀번호 재설정 이메일 전송
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Firebase Auth 예외 처리
  Exception _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return Exception('이미 사용 중인 이메일 주소입니다.');
      case 'invalid-email':
        return Exception('유효하지 않은 이메일 형식입니다.');
      case 'weak-password':
        return Exception('비밀번호가 너무 약합니다.');
      case 'user-not-found':
        return Exception('해당 이메일을 가진 사용자가 없습니다.');
      case 'wrong-password':
        return Exception('잘못된 비밀번호입니다.');
      case 'user-disabled':
        return Exception('해당 계정은 비활성화되었습니다.');
      case 'too-many-requests':
        return Exception('너무 많은 요청이 발생했습니다. 잠시 후 다시 시도해주세요.');
      default:
        return Exception('인증 오류가 발생했습니다: ${e.message}');
    }
  }
}
