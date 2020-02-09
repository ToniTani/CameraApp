//
//  CameraButtonView.swift
//  CameraApp
//
//  Created by Toni Tani on 9.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct CameraButtonView: View {
    @Binding var showActionSheet:Bool
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 38, height: 38, alignment: .center)
                .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                .frame(width: 36, height: 36, alignment: .center)
                    .foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                .overlay(
                    Image(systemName: "camera.fill")
                        .foregroundColor(.black)
                )
                
            )
        }
        
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CameraButtonView(showActionSheet: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
