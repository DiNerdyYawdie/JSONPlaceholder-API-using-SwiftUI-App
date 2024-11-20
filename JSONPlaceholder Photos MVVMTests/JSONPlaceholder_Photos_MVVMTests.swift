//

import XCTest
@testable import JSONPlaceholder_Photos_MVVM

final class JSONPlaceholder_Photos_MVVMTests: XCTestCase {

    var viewModel: PhotosListViewModel!
    var mockService: MockAPIServiceImpl!
    
    
    override func setUp() {
        super.setUp()
        mockService = MockAPIServiceImpl()
        viewModel = PhotosListViewModel(services: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    
    func testFetchPhotosSuccessful() async {
        
        // Given
        let mockPhoto = PhotoModel(albumId: 1, id: 1, title: "mock 1", url: URL(string: "google.com")!, thumbnailUrl: URL(string: "google.com")!)
        let mockPhoto2 = PhotoModel(albumId: 12, id: 12, title: "mock 12", url: URL(string: "google.com")!, thumbnailUrl: URL(string: "google.com")!)

        mockService.photosResult = .success([mockPhoto, mockPhoto2])
        
        // When
        await viewModel.fetchPhotos()
        
        // Then
        XCTAssertFalse(viewModel.photos.isEmpty)
        XCTAssertEqual(viewModel.photos.count, 2)
        
        XCTAssertEqual(viewModel.photos[0].title, "mock 1")
        XCTAssertEqual(viewModel.photos[1].title, "mock 12")
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.showErrorAlert)
        XCTAssertEqual(viewModel.errorMessage, "")
    }
    
    
}
