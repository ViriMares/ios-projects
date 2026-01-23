//
//  ContentView.swift
//  Resumee
//
//  Created by viri on 1/22/26.
//

import SwiftUI

struct ContentView: View {
    let name = "Viridiana Mares"
    var age = 33
    var workExperience = ["Honeywell", "Globant"]
    var education = ("M.E in Electrical Engineering", 2018, true)
    
    @State private var mostrarAlerta = false
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Nombre: \(name)")
            Text("Edad: \(age)")
            
            ForEach(Array(workExperience.enumerated()), id: \.offset) { index, company in
                HStack {
                    Text("Experiencia \(index + 1):")
                    Text(company)
                }
                
            }
            
            Text("Education: \(education.0) - \(String(education.1))")
            
            Button("Mostrar Alerta") {
                mostrarAlerta = true
            }
            .alert("¡Hola!", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Esta es una alerta simple.")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
