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
    @State private var valor: Double = 50000
    
    var body: some View {
        HStack {
            Image("face")
            Text("\(name)")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
        }
        
        VStack {
            
            Text("Informacion personal")
                .font(.title)
            Spacer()
            
            Text("Edad: \(age)")
            Text("Adress: Av. Italia 123")
            Text("Telefono: 3124567890")
            Spacer()
            Text("Experiencia profesional")
                .font(.title)
            Spacer()
            
            ForEach(Array(workExperience.enumerated()), id: \.offset) { index, company in
                HStack {
                    Text("Experiencia \(index + 1):")
                    Text(company)
                }
            }
            Spacer()
            
            Text("Education")
                .font(.title)
            
            Text("\(education.0) - \(String(education.1))")
            Spacer()
            
            Button("Cursos") {
                mostrarAlerta = true
            }
            .alert("Cursos en 2025", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Curso 1: Big Data\nCurso 2: Computer Vision\nCurso 3: Data Science.")
            }
            Spacer()
            
            Toggle(isOn: $isEnabled) {
                Text("Perfil")

            }
            .padding()
                        
            Text(isEnabled ? "Developer" : "Scrum master")
                            .foregroundColor(isEnabled ? .green : .red)
                            .font(.headline)
            Spacer()
            
            Text("Desired salary: \(Int(valor))")
                        Slider(value: $valor, in: 0...100000, step: 10000)
                            .padding()


        }
        .padding()
    }
}

#Preview {
    ContentView()
}
