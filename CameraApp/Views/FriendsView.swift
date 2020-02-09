//
//  FriendsView.swift
//  CameraApp
//
//  Created by Toni Tani on 9.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct FriendsView: Identifiable {
    var id:UUID = UUID()
    var name: String
    var mutualFriends:Int
    var avatar: String
    var poster: String
}

var friends:[Friend] = [
    Friend(name: "Kristina D.", mutualFriends: 350, avatar: "cristina", poster: "alps"),
    Friend(name: "David G.", mutualFriends: 1, avatar: "david", poster: "sanfransisco"),
    Friend(name: "Robert B.", mutualFriends: 22, avatar: "robert", poster: "london"),
    Friend(name: "Ruxi A.", mutualFriends: 10, avatar: "ruxi", poster: "paris"),
    Friend(name: "George B.", mutualFriends: 2, avatar: "george", poster: "newyork"),
]


struct FriendsView: View {
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FriendLineView(friend: friend).padding()
                }.navigationBarTitle("Friends")
            }
        }
    }
}
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

