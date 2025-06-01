import SwiftUI

struct LoadingView<Destination: View>: View {
    let destination: Destination

    @State private var isLoadingComplete = false

    var body: some View {
        ZStack {
            Color(hex: "#FFF8F3")
                .ignoresSafeArea()

            if isLoadingComplete {
                destination
            } else {
                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: "#A68BFA")))
                        .scaleEffect(1.5)

                    Text("Generating your mantra...")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#2B2834"))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isLoadingComplete = true
                        }
                    }
                }
            }
        }
    }
}

