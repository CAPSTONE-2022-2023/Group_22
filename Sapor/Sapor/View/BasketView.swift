//
//  BasketView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-12-06.
//

import SwiftUI
import UIKit

struct BasketItem: Hashable {
	let name: String;
	let category: String;
	let price: String;
	let qty: Int;
	let imageURL: String;
}


struct BasketView: View {
	@ObservedObject var vm = BasketViewModel()
	
	var body: some View {
		NavigationView {
			if vm.items.isEmpty {
				Text("Basket is empty!")
					.font(.largeTitle)
			} else {
				if vm.paymentSuccess {
					Text ("Thank you for the payment! \n\nYour Food is on its way")
						.multilineTextAlignment(.center)

					
				} else {
					ScrollView(.vertical){
						VStack{
							ForEach(vm.items, id: \.self) { item in
								HStack{
									// MARK: Image
									AsyncImage(url: URL(string: item.imageURL)) { image in
										image.resizable()
											.scaledToFill()
									} placeholder: {
										
									}
									.frame(width: 100, height: 100)
									.clipShape(RoundedRectangle(cornerRadius: 10))
									
									
									// MARK: Middle VStack
									VStack(alignment: .leading){
										Text(item.name)
											.bold()
										
										Text(item.category)
											.font(.callout)
											.foregroundColor(.secondary)
										Spacer()
										HStack(spacing: 10){
											Image(systemName: "minus")
												.onTapGesture {
													// decrement
													vm.increment(qty: -1, item: item)
												}
											
											
											Text("\(item.qty)")
											
											Image(systemName: "plus")
												.onTapGesture {
													// increment
													vm.increment(qty: 1, item: item)
												}
										}
									}
									
									Spacer()
									VStack(alignment: .trailing){
										Button {
											vm.deleteItem(item: item)
										} label: {
											Image(systemName: "multiply.circle.fill")
												.foregroundColor(.primary)
										}
										
										
										Spacer()
										Text("$" + String(format: "%.2f", Double(item.price)! * Double(item.qty)))
											.bold()
											.font(.title3)
											.foregroundColor(.orange)
									}
								}
								.padding()
								.background(.gray.opacity(0.1))
								.clipShape(RoundedRectangle(cornerRadius: 10))
								.padding(.horizontal)
								.padding(.top)
							}
						}
						.navigationTitle("Basket")
					}
					.overlay(alignment: .bottom, content: {
						Button {
							vm.pay()
							print("Button Clicked")
							
						} label: {
							RoundedRectangle(cornerRadius: 50)
								.frame(height: 60)
								.foregroundColor(.orange)
								.padding(.horizontal, 40)
								.shadow(radius: 5)
								.overlay {
									Text("Total: $" + String(format: "%.2f", vm.total) + "\n Check out")
										.bold()
										.foregroundColor(.white)
								}
								.padding(.vertical)
						}
					})
					
				}
				
			}
		}
		.onDisappear{
			if vm.paymentSuccess{
				vm.paymentSuccess = false
			}
		}
	}
}

struct BasketView_Previews: PreviewProvider {
	static var previews: some View {
		BasketView()
	}
}
