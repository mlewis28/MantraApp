import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        List {
            Section {
                settingsRow(icon: "person.fill", title: "Edit Profile")
                settingsRow(icon: "alarm", title: "Daily Reminder Time", subtitle: "8.00 AM\nWe'll remind you at this time every morning.")
                settingsRow(icon: "lock.rotation", title: "Lock Screen Widget Setup")
                settingsRow(icon: "gift.fill", title: "Invite a Friend")
                settingsRow(icon: "creditcard.fill", title: "Manage Membership", subtitle: "Weekly – $2.99\nChanges handled via App Store")
                settingsRow(icon: "doc.text.fill", title: "Terms & Privacy Policy")
                settingsRow(icon: "questionmark.circle.fill", title: "Help & Support")
            }

            Section {
                Button(action: {
                    authViewModel.signOut()
                }) {
                    HStack {
                        Image(systemName: "arrow.backward.square.fill")
                            .foregroundColor(.red)
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .listStyle(InsetGroupedListStyle())
    }

    private func settingsRow(icon: String, title: String, subtitle: String? = nil) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.purple)
                Text(title)
                    .font(.headline)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 4)
    }
}

