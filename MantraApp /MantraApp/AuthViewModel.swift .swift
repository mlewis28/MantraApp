import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var userName: String = "Loading..."

    init() {
        self.isSignedIn = Auth.auth().currentUser != nil
        self.userName = Auth.auth().currentUser?.displayName ?? "User"
    }

    func signup(email: String, password: String, name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("❌ Firebase signup error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let user = result?.user else {
                completion(.failure(NSError(domain: "Missing User", code: -1)))
                return
            }

            // Set displayName
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = name
            changeRequest.commitChanges { error in
                if let error = error {
                    print("❌ Failed to update displayName: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }

                // Save to Firestore
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData([
                    "name": name,
                    "email": email
                ])

                // Reload and update UI
                user.reload { _ in
                    DispatchQueue.main.async {
                        self.userName = Auth.auth().currentUser?.displayName ?? "User"
                        self.isSignedIn = true
                        completion(.success(()))
                    }
                }
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
            self.userName = ""
        } catch {
            print("Sign out error:", error.localizedDescription)
        }
    }
}

