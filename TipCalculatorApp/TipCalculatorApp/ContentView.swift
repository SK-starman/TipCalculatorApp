//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Kalidy, Sammer on 1/27/25.
//

import SwiftUI

// The main content view for the Tip Calculator App
struct ContentView: View {
    // Step 1: Define @State variables
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 15.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResults: Bool = false
    
    // Step 2: Computed properties to calculate tip, total, and per person amounts
    var tipAmount: Double {
        return billAmount * (tipPercentage / 100)
    }

    var totalAmount: Double {
        return billAmount + tipAmount
    }

    var amountPerPerson: Double {
        return totalAmount / numberOfPeople
    }

    var body: some View {
        VStack {
            // Step 3: Add an Image
            Image(systemName: "dollarsign.circle.fill") // You can replace this with your own image if needed
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding(.top, 50)
            
            // Title at the top of the screen
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding()

            // Background color for the whole view
            ZStack {
                Color("backgroundColor") // Custom background color
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Input Sliders and Labels
                    VStack(spacing: 20) {
                        // Bill Amount Slider
                        Text("Bill Amount: \(billAmount, format: .currency(code: "USD"))")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Slider(value: $billAmount, in: 0...500, step: 1)
                            .accentColor(.green)
                            .padding()

                        // Tip Percentage Slider
                        Text("Tip Percentage: \(Int(tipPercentage))%")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Slider(value: $tipPercentage, in: 0...30, step: 1)
                            .accentColor(.yellow)
                            .padding()

                        // Number of People Slider
                        Text("Number of People: \(Int(numberOfPeople))")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Slider(value: $numberOfPeople, in: 1...20, step: 1)
                            .accentColor(.blue)
                            .padding()
                    }

                    Spacer()
                    
                    // Conditional Display for Results
                    if showResults {
                        VStack(spacing: 20) {
                            Text("Tip Amount: \(tipAmount, format: .currency(code: "USD"))")
                            Text("Total Amount: \(totalAmount, format: .currency(code: "USD"))")
                            Text("Amount Per Person: \(amountPerPerson, format: .currency(code: "USD"))")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                    }

                    Spacer()
                    
                    // Button to toggle results visibility
                    Button(action: {
                        showResults.toggle()
                    }) {
                        Text(showResults ? "Hide Results" : "Calculate")
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50)
                            .foregroundColor(.white)
                            .background(showResults ? Color.red : Color.blue)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
