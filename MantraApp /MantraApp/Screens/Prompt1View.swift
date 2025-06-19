import SwiftUI

struct Prompt1View: View {
    @State private var responseText: String = ""
    let mood: String

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()

                // Prompt Question
                Text("How are you feeling right now?")
                    .font(.title2.bold())
                    .foregroundColor(Color(hex: "#2B2834"))
                    .multilineTextAlignment(.center)
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

                // Continue Button ➝ Prompt2View
                NavigationLink(destination: Prompt2View(
                    mood: mood,
                    prompt1: responseText
                )) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(hex: "#A6B8FA"))
                        .cornerRadius(18)
                        .padding(.horizontal, 24)
                }
                .disabled(responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || mood.isEmpty)
                .opacity((responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || mood.isEmpty) ? 0.5 : 1.0)

                Spacer()
            }
            .background(Color(hex: "#FFF8F3")).ignoresSafeArea()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

