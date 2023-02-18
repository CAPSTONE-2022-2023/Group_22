//
//  WishlistView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2023-02-18.
//

import SwiftUI

struct WishlistView: View {
    @ObservedObject var vm: WishViewModel = .shared
    var body: some View {
        VStack {
            ForEach(vm.wishlist, id: \.self) { itemName in
                Text(itemName)
            }
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
