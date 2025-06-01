import SwiftUI

struct AuthLandingView: View {
    @State private var navigateToLogin = false
    @State private var navigateToSignUp = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#F5F0E8") // soft beige
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("Mantra")
                        .font(.custom("Georgia-Bold", size: 48))
                        .foregroundColor(.black)
                        .padding(.top, 40)

                    Spacer()

                    VStack(spacing: 20) {
                        Button(action: {
                            navigateToLogin = true
                        }) {
                            Text("Log In")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(14)
                        }

                        Button(action: {
                            navigateToSignUp = true
                        }) {
                            Text("Sign Up")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.black, lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(.horizontal, 40)

                    Spacer()
                }
                .padding(.vertical, 30)
                .navigationDestination(isPresented: $navigateToLogin) {
                    LoginView()
                }
                .navigationDestination(isPresented: $navigateToSignUp) {
                    SignUpView()
                }
            }
        }
    }
}

