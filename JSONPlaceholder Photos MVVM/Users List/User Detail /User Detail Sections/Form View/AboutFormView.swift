//

import SwiftUI

struct AboutFormView: View {
    
    @ObservedObject var viewModel: UserDetailViewModel
    
    var body: some View {
        Form {
            Section {
                Text("\(viewModel.user.address.street), \(viewModel.user.address.city)")
                Text("Zip code: \(viewModel.user.address.zipcode)")
                Text(viewModel.user.address.suite)
            } header: {
                Text("Address")
            }

            Section {
                Text(viewModel.user.company.name)
                Text(viewModel.user.company.catchPhrase)
            } header: {
                Text("Company")
            }

        }
    }
}

#Preview {
    AboutFormView(viewModel: UserDetailViewModel(user: UserModel(id: 1, name: "Nerdy Yawdie", username: "Nerd", email: "nerdyyawdie@yoo.com", address: UserAddress(street: "1 Hundred Lane", suite: "Suite 876", city: "Kingston", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "Anyone can learn anything, with Time, Practice & Failures", bs: "")), services: APIServicesImpl()))
}
