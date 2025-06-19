import SwiftUI

struct Prompt2View: View {
    var mood: String
    var prompt1: String

    @State private var responseText: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()

                // Phase Title
                Text("• Phase 2: Reflect •")
                    .font(.title3)
                    .foregroundColor(Color(hex: "#2B2834"))
                    .bold()

                // Static Prompt Question
                Text("Why do you think you're feeling this way?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "#2B2834"))
                    .padding(.horizontal, 24)

                // Input Box
                TextEditor(text: $responseText)
                    .frame(height: 150)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(hex: "#A6B8FA"), lineWidth: 1.5)
                    )
                    .padding(.horizontal, 24)

                // Continue Button → Goes to Prompt3View
                NavigationLink(
                    destination: Prompt3View(
                        mood: mood,
                        prompt1: prompt1,
                        prompt2: responseText,
                        mantra: "" // placeholder for now
                    )
                ) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#A6B8FA"))
                        .cornerRadius(20)
                        .padding(.horizontal, 24)
                }
                .disabled(responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .opacity(responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)

                Spacer()
            }
            .background(Color(hex: "#FFF8F3"))
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

