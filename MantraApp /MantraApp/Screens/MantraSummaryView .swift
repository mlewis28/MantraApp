import SwiftUI

struct MantraSummaryView: View {
    var mood: String
    var prompt1: String
    var prompt2: String
    var prompt3: String
    var mantra: String
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#FFE683"), Color(hex: "#D8CCF6")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Main content - centered like mockup
            VStack(spacing: 0) {
                Spacer()
                
                // Mantra Card - perfectly centered
                VStack(spacing: 20) {
                    Text("Your Mantra for Today")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "#2B2834"))
                    
                    Text(mantra)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "#2B2834"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 32)
                .background(Color.white.opacity(0.9))
                .cornerRadius(24)
                .padding(.horizontal, 24)
                
                Spacer().frame(height: 40)
                
                // Buttons - side by side like mockup
                HStack(spacing: 12) {
                    Button(action: {
                        // Update widget logic here
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 14, weight: .medium))
                            Text("Update Widget")
                                .font(.system(size: 15, weight: .medium))
                        }
                        .foregroundColor(Color(hex: "#2B2834"))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(22)
                    }
                    
                    Button(action: {
                        // Share logic here
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 14, weight: .medium))
                            Text("Share")
                                .font(.system(size: 15, weight: .medium))
                        }
                        .foregroundColor(Color(hex: "#2B2834"))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(22)
                    }
                }
                
                Spacer()
            }
            
            // Floating arrow button - positioned exactly like mockup
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Save the journal entry
                        saveJournalEntry()
                        
                        // Go back to WelcomeView (THIS IS THE FIX!)
                        resetToWelcomeView()
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(hex: "#2B2834"))
                            .frame(width: 56, height: 56)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                    }
                    .padding(.trailing, 28)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // SAVES YOUR DATA TO HISTORY ✅
    func saveJournalEntry() {
        let entry = JournalEntry(
            date: Date(),
            mood: mood,
            text: mantra,
            colorHex: "#A6B8FA",
            prompts: [prompt1, prompt2, prompt3]
        )
        
        JournalManager.shared.saveEntry(entry)
        print("✅ Journal entry saved successfully!")
    }
    
    // RESETS NAVIGATION TO WELCOMEVIEW ✅
    func resetToWelcomeView() {
        // Try method 1: Multiple dismisses
        DispatchQueue.main.async {
            self.presentationMode.wrappedValue.dismiss()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.presentationMode.wrappedValue.dismiss()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.presentationMode.wrappedValue.dismiss()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.presentationMode.wrappedValue.dismiss()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.presentationMode.wrappedValue.dismiss()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
}
