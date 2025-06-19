import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    // Horizontal Greeting
                    HStack(spacing: 8) {
                        Text("🌞")
                            .font(.system(size: 28))
                        Text("Good morning, \(authViewModel.userName.isEmpty ? "Friend" : authViewModel.userName)")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(hex: "#2B2834"))
                    }
                    .padding(.bottom, 4)

                    Text("Time to check in, and win your day.")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#5B5564"))

                    Spacer()

                    // Buttons
                    VStack(spacing: 16) {
                        NavigationLink(destination: NewMantraView()) {
                            Text("Start New Mantra")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .background(Color(hex: "#A68BFA"))
                                .cornerRadius(18)
                        }

                        NavigationLink(destination: HistoryView()) {
                            Text("View History")
                                .foregroundColor(Color(hex: "#2B2834"))
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color(hex: "#A68BFA"), lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 60)
                }
                .navigationBarItems(trailing:
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                )
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}


