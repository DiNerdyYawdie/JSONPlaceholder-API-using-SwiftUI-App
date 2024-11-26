//

import XCTest
@testable import JSONPlaceholder_Photos_MVVM

final class UsersListViewModelTestss: XCTestCase {

    var viewModel: UsersListViewModel!
    var service: MockAPIServiceImpl!
    
    override func setUp() {
        super.setUp()
        service = MockAPIServiceImpl()
        viewModel = UsersListViewModel(services: service)
    }
                                       
    override func tearDown() {
        
        viewModel = nil
        service = nil
        super.tearDown()
    }
    
    func testSuccessfullyFetchUsers() async {
        
        // Given
        let mockUser = UserModel(id: 1, name: "Nerdy Yawdie", username: "Nerd", email: "nerdyyawdie@yoo.com", address: UserAddress(street: "1 Hundred Lane", suite: "Suite 876", city: "Kingston", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "Anyone can learn anything, with Time, Practice & Failures", bs: ""))
        
        let mockUser2 = UserModel(id: 2, name: "Sam", username: "Mantha", email: "samantha@yoo.com", address: UserAddress(street: "2 Something Ave", suite: "Suite 767", city: "Portmore", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "Anyone can learn anything, with Time, Practice & Failures", bs: ""))
        
        service.usersResult = .success([mockUser, mockUser2])
        
        // When
        await viewModel.fetchUsers()
        
        
        //Then
        XCTAssertTrue(!viewModel.users.isEmpty)
        XCTAssertEqual(viewModel.users.count, 2)
        
        XCTAssertEqual(viewModel.users[0].name, "Nerdy Yawdie")
        XCTAssertEqual(viewModel.users[1].name, "Sam")
        
        XCTAssertFalse(viewModel.showErrorAlert)
        XCTAssertFalse(viewModel.isLoading)
        
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }

}
