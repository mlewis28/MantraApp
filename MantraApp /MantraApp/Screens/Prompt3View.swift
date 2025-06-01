import SwiftUI

struct Prompt3View: View {
    var mood: String
    var prompt1: String
    var prompt2: String
    var mantra: String

    @State private var responseText: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()

                // Prompt Title
                Text("• Phase 3: Reframe")
                    .font(.title3)
                    .foregroundColor(Color(hex: "#2B2834"))
                    .bold()

                // Prompt Question
                Text("What’s something you’re grateful for right now?")
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
                            .stroke(Color(hex: "#A6BBFA"), lineWidth: 1.5)
                    )
                    .padding(.horizontal, 24)

                // Continue Button → LoadingView → MantraSummaryView
                NavigationLink(
                    destination: LoadingView(destination:
                        AnyView(
                            MantraSummaryView(
                                mood: mood,
                                prompt1: prompt1,
                                prompt2: prompt2,
                                prompt3: responseText,
                                mantra: mantra
                            )
                        )
                    )
                ) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(hex: "#A6BBFA"))
                        .cornerRadius(20)
                        .padding(.horizontal, 24)
                }
                .disabled(responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .opacity(responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)

                Spacer()
            }
            .background(Color(hex: "#FFF8F3").ignoresSafeArea())
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

