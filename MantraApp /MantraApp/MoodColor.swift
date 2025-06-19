import Foundation

func colorForMood(_ mood: String) -> String {
    switch mood.lowercased() {
    case "overwhelmed":
        return "#A68BFA" // Purple
    case "grateful":
        return "#4A9A87" // Teal-green
    case "bored":
        return "#DAA85F" // Gold
    case "content":
        return "#A35A4F" // Soft red-brown
    default:
        return "#A6B8FA" // Default blue
    }
}

