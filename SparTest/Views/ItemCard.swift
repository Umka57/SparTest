
import SwiftUI

struct ItemCard: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            ZStack {
                
                VStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 130, alignment: .top)
                        .padding(.top, 15)
                    
                    Spacer()
                    
                    HStack {
                        
                        if item.priceWithSale != nil {
                            VStack(spacing: 0) {
                                HStack(spacing: 5) {
                                    Text(String(item.priceWithSale ?? 0))
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Image("rub-for-piece")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20, alignment: .center)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 20)
                                
                                Text(String(item.price))
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .strikethrough(true, color: .gray.opacity(0.5))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }.padding(.leading, 5)
                            
                        } else {
                            HStack(spacing: 2) {
                                Text(String(item.price))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Image("rub-for-piece")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20, alignment: .center)
                            }
                            .padding(.horizontal, 5)
                        }
                        
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.green)
                                
                                Image("cart-3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(Color.white)
                            }
                        })
                    }
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                }
                
                if let category = item.category {
                    HStack {
                        Text(category.rawValue)
                            .font(.system(size: 10, weight: .light))
                            .padding(4)
                            .padding(.trailing, 5)
                            .padding(.leading, 20)
                            .foregroundColor(Color.white)
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(10)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .offset(x: -10)
                    
                }
            }
        }
        .frame(width: 130, height: 200, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 1, y: 1)
        .padding(10)
        .cornerRadius(10)
        
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = ItemModel(id: 1, name: "Сыр", price: 259.90, image: "spar-tree-logo")
        let item2 = ItemModel(id: 2, name: "Кола", price: 99.90, image: "spar-tree-logo", category: .superPrice)
        let item3 = ItemModel(id: 3, name: "Туалетная бумага", price: 489.90, priceWithSale: 309.90, image: "spar-tree-logo", category: .priceStrike)
        
        ItemCard(item: item3)
    }
}
