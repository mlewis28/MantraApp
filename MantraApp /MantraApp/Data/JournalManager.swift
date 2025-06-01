import Foundation

class JournalManager: ObservableObject {
    static let shared = JournalManager()
    private let entriesKey = "journal_entries"

    @Published var entries: [JournalEntry] = []

    private init() {
        loadEntries()
    }

    func saveEntry(_ entry: JournalEntry) {
        entries.append(entry)
        persistEntries()
    }

    func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: entriesKey),
           let savedEntries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            entries = savedEntries
        }
    }

    private func persistEntries() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: entriesKey)
        }
    }
}

