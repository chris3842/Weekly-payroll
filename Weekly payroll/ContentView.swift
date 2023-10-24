//
//  ContentView.swift
//  Weekly payroll
//
//  Created by christopher robles quezada on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var hourlyWageTextfield = ""
    @State private var hoursWorkedTextField = ""
    @State private var pay = 0.0
    @State private var W = 0.0
    @State private var E = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
                .padding()
            CustomTextfield(placeholder: "Hourly Wage", variable: $hourlyWageTextfield)
            CustomTextfield(placeholder: "Hours Worked", variable: $hoursWorkedTextField)
            Button("Calculate") {
                pay = 0.0
                if let hourlyWage = Double(hourlyWageTextfield) {
                    if let hoursWorked = Double(hoursWorkedTextField) {
                        pay = calculateGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                    }
                }
            }
            .padding()
            CustomText(text: "GrossPay")
            CustomText(text: "$" + String(format: "%.2f", pay))
            Spacer()
        }
    }
            func calculateGrossPay(hourlyWage: Double, hoursWorked: Double) -> Double {
                
                 if hoursWorked > 40
                {
                     E = hourlyWage * 40
                     W = hourlyWage * 1.5 * (hoursWorked - 40)
                     return E + W
                 }
                else
                {
                     return hourlyWage * hoursWorked
                }
                
                
            }
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
        struct CustomTextfield:View {
            let placeholder : String
            let variable : Binding<String>
            var body: some View {
                TextField(placeholder, text: variable)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.body)
                    .padding()
            }
        }
           
        struct CustomText: View {
            let text : String
            var body: some View {
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
