
import SwiftUI

struct MainView: View {
    
    let mockStories: [String] = [
        "Привилегии «Мой SPAR»",
        "Мы в соцсетях",
        "3 рецепта коктейлей",
        "Дегустации в SPAR",
        "Новинки недели"
    ]
    let mockSaleCards: [String] = [
        "saleCard",
        "saleCard2",
        "saleCard3"
    ]
    
    let mockInfoCards: [InfoCardModel] = [
        InfoCardModel(id: 1, text: "Абонемент на кофе", color: Color.green, imageName: "cup.and.saucer.fill"),
        InfoCardModel(id: 2, text: "Мои скидки", color: Color.red, imageName: "cart"),
        InfoCardModel(id: 3, text: "Карта в подарок", color: Color.gray, imageName: "creditcard"),
        InfoCardModel(id: 4, text: "Доставка за 1 час", color: Color.blue, imageName: "paperplane")
    ]
    
    let mockItemsCategories: [CategoryModel] = [
        CategoryModel(name: "Рекомендуем", items: [
            ItemModel(id: 1, name: "Сыр", price: 259.90, image: "spar-tree-logo"),
            ItemModel(id: 2, name: "Кола", price: 99.90, image: "spar-tree-logo", category: .superPrice),
            ItemModel(id: 3, name: "Туалетная бумага", price: 489.90, priceWithSale: 309.90, image: "spar-tree-logo", category: .priceStrike)
        ]),
        CategoryModel(name: "Сладкое настроение", items: [
            ItemModel(id: 4, name: "Сорбет", price: 99.90, image: "spar-tree-logo"),
            ItemModel(id: 5, name: "Сорбет", price: 99.90, image: "spar-tree-logo"),
            ItemModel(id: 6, name: "Сорбет", price: 99.90, image: "spar-tree-logo")
        ])
    ]
    
    var body: some View {
        //Main body
        VStack(spacing: 0) {
            
            // Search Header
            VStack(spacing: 7) {
                
                HStack {
                    HStack(spacing: 5) {
                        Image("location-pin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Москва, Москва и Московская область")
                            .font(.system(size: 14))
                    }
                    .frame(idealWidth: 300, maxWidth: .infinity, idealHeight: 40, maxHeight: 40, alignment: .leading)
                    .padding(.leading, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    )
                    
                    Image("burger-menu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(.horizontal, 10)
                .background(Color.white)
                
                Divider().background(Color.gray.opacity(0.5))
            }
            
            ScrollView(.vertical) {
                // Stories scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(mockStories, id: \.self) { story in
                            StoriesIconView(imageName: "spar-tree-logo", text: story)
                        }
                    }
                    .padding(.leading, 5)
                }
                .frame(height: 100)
                .padding(.top, 5)
                
                // Card scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(mockSaleCards, id:\.self) { card in
                            Image("saleCardImage")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 320, height: 170)
                                .cornerRadius(20)
                        }
                    }.padding(.horizontal, 10)
                }
                .padding(.top, 10)
                
                // Bonus card
                HStack {
                    Image("bonusCardImage")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                
                // Recomendation cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(mockInfoCards, id: \.self) { card in
                            InfoCardView(card: card)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        }
                    }.padding(.horizontal, 10)
                }
                
                // Items categories scroll
                ForEach(mockItemsCategories, id: \.self) { category in
                    VStack {
                        
                        Text(category.name)
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 40)
                            .padding(.horizontal, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(category.items, id: \.self) { item in
                                    ItemCard(item: item)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct StoriesIconView: View {

    var imageName: String
    var text: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
                .background(
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 55, height: 55)
                )
            
            Text(text)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
                .font(.system(size: 12))
            
        }
        .frame(width: 80,height: 90, alignment: .top)
        .padding(.top, 10)
    }
}

// MARK: - InfoCard

struct InfoCardModel: Hashable {
    var id: Int
    var text: String
    var color: Color
    var imageName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct InfoCardView: View {
    
    var card: InfoCardModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(card.color.opacity(0.3))
            
            VStack {
                Text(card.text)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.top, 10)
                    .padding(.leading, 7)
                    .frame(width: 90, height: 60, alignment: .topLeading)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(2)
                
                Image(systemName: card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                    .frame(width: 100, height: 60, alignment: .bottomTrailing)
            }
        }
        .frame(width: 100, height: 120, alignment: .center)
    }
}

struct CategoryModel: Hashable {
    var name: String
    var items: [ItemModel]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        return lhs.name == rhs.name
    }
}

struct ItemModel: Hashable {
    var id: Int
    var name: String
    var price: Double
    var priceWithSale: Double?
    var image: String
    var category: SaleCetegory?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.id == rhs.id
    }
}

enum SaleCetegory: String {
    case superPrice = "Супер цена"
    case priceStrike = "Удар по ценам"
}
