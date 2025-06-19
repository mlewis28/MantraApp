import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isLoggingIn = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(hex: "#F5F0E8") // Beige
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                Text("Welcome Back")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)

                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                Button(action: logIn) {
                    Text(isLoggingIn ? "Logging In..." : "Log In")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 40)

                Button(action: {
                    dismiss()
                }) {
                    Text("Don't have an account? Sign Up")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .underline()
                }

                Spacer()
            }
            .padding(.vertical, 40)
        }
    }

    func logIn() {
        isLoggingIn = true
        AuthManager.shared.signIn(email: email, password: password) { result in
            isLoggingIn = false
            switch result {
            case .success:
                // TODO: Route to WelcomeView
                print("✅ Logged in successfully")
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

