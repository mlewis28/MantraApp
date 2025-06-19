import SwiftUI

struct HistoryView: View {
    @ObservedObject var journalManager = JournalManager.shared

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    ForEach(journalManager.entries.reversed()) { entry in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(entry.date.formatted(.dateTime.month().day().year()))
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text(entry.mood.capitalized)
                                .font(.caption)
                                .bold()
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.25))
                                .cornerRadius(8)

                            Text(entry.text)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color(hex: "#2B2834"))
                        }
                        Divider()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .navigationTitle("Mantra")
            .onAppear {
                journalManager.loadEntries()
            }
        }
    }
}

