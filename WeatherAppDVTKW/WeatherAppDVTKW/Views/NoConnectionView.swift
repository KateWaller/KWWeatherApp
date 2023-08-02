//
//  NoConnectionView.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import SwiftUI

struct NoConnectionView: View {
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .foregroundColor(Color(.systemGray5))
            Text("Data Unavailable")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            Text("You aren't connected to the internet.")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(Color(uiColor: .systemGray5))
            
            Spacer()
        }
        .padding()
    }
}


struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
    }
}

