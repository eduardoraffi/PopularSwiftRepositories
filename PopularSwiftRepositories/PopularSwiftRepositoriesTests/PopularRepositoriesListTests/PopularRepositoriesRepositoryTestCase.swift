import XCTest

final class PopularSwiftRepositoriesTestCase: XCTestCase {

    var sut: PopularRepositoriesRepository!
    var apiClient: APIClientStub!

    override func setUp() async throws {
        apiClient = APIClientStub()
        sut = PopularRepositoriesRepository(apiClient: apiClient)
    }

    override func tearDown() {
        apiClient = nil
        sut = nil
    }

    func testFetchPopularRepositoriesWithoutError() async throws {
        setupApiStubData()
        let response: PopularSwiftRepositoriesModel = try await sut.fetchPopularRepositories(page: 1)
        XCTAssertNotNil(response)
    }

    func testFetchPopularRepositoriesWithDataError() async throws {
        setupApiStubData(.invalidResponse)
        do {
            let _: PopularSwiftRepositoriesModel = try await sut.fetchPopularRepositories(page: 1)
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFetchPopularRepositoriesWithDecodingError() async throws {
        setupApiStubData(.decodingError(MockedError.genericError))
        do {
            let _: PopularSwiftRepositoriesModel = try await sut.fetchPopularRepositories(page: 1)
        } catch {
            
            XCTAssertTrue(error.localizedDescription.contains("Decoding error:"))
        }
    }
    
    func testFetchPopularRepositoriesWithResponseCodeError() async throws {
        setupApiStubData(.serverError(500))
        do {
            let _: PopularSwiftRepositoriesModel = try await sut.fetchPopularRepositories(page: 1)
        } catch {
            XCTAssertNotNil(error)
        }
    }

    private func setupApiStubData(_ error: APIError? = nil) {
        if let error = error {
            switch error {
            case .invalidURL:
                break
            case .invalidResponse:
                apiClient.data = nil
            case .decodingError(_):
                apiClient.data = GlobalDataMock.shared.getPopularRepositoriesResponseDataDecodingError()
            case .serverError(_):
                apiClient.responseCode = 500
            }
        } else {
            apiClient.data = GlobalDataMock.shared.getPopularRepositoriesResponseData()
        }
    }

}
