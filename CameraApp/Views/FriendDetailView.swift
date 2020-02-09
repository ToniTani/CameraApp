//
//  FriendDetailView.swift
//  CameraApp
//
//  Created by Toni Tani on 9.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    
    var friend:Friend
    
    @State var showImagePicker:Bool = false
    @State var showActionSheet:Bool = false
    @State var image:Image?
    @State var sourceType:Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                Image(friend.poster)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.leading, .trailing])
                VStack {
                    image?
                        .resizable()
                        .clipped()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 160)
                        .overlay(
                            CameraButtonView(showActionSheet: $showActionSheet)
                                .offset(x: 50, y: 65)
                    )
                    Text(friend.name)
                        .fontWeight(.bold)
                }.offset(y: -70)
                Spacer()
            }
            .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the image gallery or use the camera"), buttons: [
                    ActionSheet.Button.default(Text("Camera"), action: {
                        self.sourceType = 0
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.default(Text("Photo Gallery"), action: {
                        self.sourceType = 1
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.cancel()
                ])
            })
            if showImagePicker {
                ImagePicker(isVisibile: $showImagePicker, image: $image, sourceType: sourceType)
            }
        }
        .onAppear { self.image = Image(self.friend.avatar) }
        .navigationBarTitle(Text(friend.name), displayMode: .inline)
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: friends[0])
    }
}
