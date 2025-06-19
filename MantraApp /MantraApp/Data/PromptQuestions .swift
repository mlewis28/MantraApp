import Foundation

struct PromptQuestionBank {
    static let questions: [String: [String]] = [
        "anxious_phase1": [
            "What are you feeling right now?",
            "Where in your body are you feeling this the most?"
        ],
        "anxious_phase2": [
            "What thoughts are fueling your anxiety?",
            "What's contributing to this feeling today?"
        ],
        "anxious_phase3": [
            "What would you like to focus on instead?",
            "What could help you feel safer or calmer right now?"
        ],
        "grateful_phase1": [
            "What are you feeling right now?",
            "What made you smile today?"
        ],
        "grateful_phase2": [
            "Why do you feel this way?",
            "What are you thankful for?"
        ],
        "grateful_phase3": [
            "How can you carry this gratitude with you?",
            "What would you like to focus on today?"
        ]
        // Add more moods and phases...
    ]
    
    static func getQuestion(for mood: String, phase: Int) -> String {
        let key = "\(mood.lowercased())_phase\(phase)"
        let options = questions[key] ?? ["What are you feeling right now?"]
        return options.randomElement() ?? options[0]
    }
}

