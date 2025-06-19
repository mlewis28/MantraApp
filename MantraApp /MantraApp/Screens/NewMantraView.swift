import SwiftUI

struct NewMantraView: View {
    @State private var selectedMood: String? = nil
    @State private var navigateToPrompt = false

    let moods: [(String, String)] = [
        ("Stressed", "#FBE8E7"), ("Frustrated", "#FBE8E7"), ("Overwhelmed", "#FBE8E7"), ("Anxious", "#FBE8E7"),
        ("Angry", "#E9E5F4"), ("Sad", "#E9E5F4"), ("Lonely", "#E9E5F4"), ("Tired", "#E9E5F4"),
        ("Insecure", "#E9E5F4"), ("Fine", "#E9E5F4"),
        ("Calm", "#E6F1E8"), ("Content", "#E6F1E8"), ("Reflective", "#E6F1E8"), ("Happy", "#E6F1E8"),
        ("Grateful", "#E6F1E8"), ("Excited", "#E6F1E8"), ("Hopeful", "#E6F1E8"), ("Motivated", "#E6F1E8")
    ].shuffled()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("How are you feeling?")
                    .font(.title)
                    .bold()
                    .padding(.top, 40)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                    ForEach(moods, id: \.0) { mood, color in
                        Button(action: {
                            selectedMood = mood
                        }) {
                            Text(mood)
                                .foregroundColor(.black)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(hex: color))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(selectedMood == mood ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                )
                        }
                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                Button(action: {
                    navigateToPrompt = true
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedMood != nil ? Color(hex: "#A68BFA") : Color.gray)
                        .cornerRadius(20)
                }
                .disabled(selectedMood == nil)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
            .background(Color(hex: "#FFF8F3").ignoresSafeArea())
            .navigationDestination(isPresented: $navigateToPrompt) {
                Prompt1View(mood: selectedMood ?? "")
            }
        }
    }
}

