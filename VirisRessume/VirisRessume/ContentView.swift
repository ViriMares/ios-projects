//
//  ContentView.swift
//  VirisRessume
//
//  Created by leo on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    let name = "Viridiana Mares"
    var age = 33
    var workExperience = ["Honeywell", "Globant"]
    var education = ("M.E in Electrical Engineering", 2018, true)
    @State private var mostrarAlerta = false
    @State private var isEnabled = false
    @State private var valor: Double = 50
    
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
            
            Button("Cursos") {
                mostrarAlerta = true
            }
            .alert("Cursos en 2025", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Curso 1: Big Data\nCurso 2: Computer Vision\nCurso 3: Data Science.")
            }
            
            
            
            Toggle(isOn: $isEnabled) {
                Text("Perfil")
            }
            .padding()
                        
            Text(isEnabled ? "Developer" : "Scrum master")
                            .foregroundColor(isEnabled ? .green : .red)
                            .font(.headline)
            
            Text(": \(Int(valor))")
                        Slider(value: $valor, in: 0...100, step: 1)
                            .padding()


        }
        .padding()
    }
}

#Preview {
    ContentView()
}
