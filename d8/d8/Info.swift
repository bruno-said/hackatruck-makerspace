//
//  Info.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import SwiftUI

struct Info: View {
    var personagem: HaPo?
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 5)
            VStack {
                AsyncImage(url: URL(string: personagem?.image ?? "https://ik.imagekit.io/hpapi/harry.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .clipShape(.circle)
                VStack {
                    HStack {
                        Text("House:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text(personagem?.house ?? "house")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    HStack {
                        Text("Name:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text(personagem?.name ?? "name")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    HStack {
                        Text("Date:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text(personagem?.dateOfBirth ?? "date")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    HStack {
                        Text("Eyes:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text(personagem?.eyeColour ?? "eyes")
                            .font(.title)
                            .foregroundStyle(.white)
                    }        }
                .frame(width: 270, height: 200)
                .background(Color("DarkRed"))
                .cornerRadius(15)
                Spacer()
            }
        }
    }
}

#Preview {
    Info()
}
