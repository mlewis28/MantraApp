import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if authViewModel.isSignedIn {
            WelcomeView()
        } else {
            AuthLandingView()
        }
    }
}
