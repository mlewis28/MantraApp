import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String?
    @State private var isCreating = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            Color(hex: "#FFF8F3")
                .ignoresSafeArea()

            VStack(spacing: 38) {
                Spacer()

                Text("Create Your Account")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)

                VStack(spacing: 20) {
                    TextField("Name", text: $name)
                        .autocapitalization(.words)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)

                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)

                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)

                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                Button(action: registerUser) {
                    Text(isCreating ? "Creating Account..." : "Sign Up")
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 40)

                Button(action: {
                    dismiss()
                }) {
                    Text("Already have an account? Log In")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .underline()
                }

                Spacer()
            }
        }
    }

    func registerUser() {
        isCreating = true
        errorMessage = nil

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            isCreating = false
            return
        }
        authViewModel.signup(email: email, password: password, name: name) { result in
            isCreating = false
            switch result {
            case .success:
                dismiss()
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}
