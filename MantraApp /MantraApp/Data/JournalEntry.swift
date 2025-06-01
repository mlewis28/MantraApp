import Foundation

struct JournalEntry: Identifiable, Codable {
    var id: String = UUID().uuidString
    var date: Date
    var mood: String
    var text: String
    var colorHex: String
    var prompts: [String]
}

