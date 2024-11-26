//

import SwiftUI

struct UserRowView: View {
    
    let user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.username)
                      .fontWeight(.bold)
                
                Spacer()
                Text("\(user.address.street), \(user.address.city)")
                    .foregroundStyle(.secondary)
                
            }
            .padding(.bottom)
          
            
            Text(user.company.name)
        }
    }
}

#Preview {
    UserRowView(user: UserModel(id: 1, name: "Nerdy Yawdie", username: "Nerd", email: "nerdyyawdie@yoo.com", address: UserAddress(street: "Test Street", suite: "Suite", city: "Kingston", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "some stuff", bs: "")))
}
