//
//  MovieAPITest.swift
//  BoxOfficeTests
//
//  Created by Sunny on 2023/05/02.
//

import XCTest
@testable import BoxOffice

final class MovieAPITest: XCTestCase {
    
    var sut: NetworkProvidable!
    let endPoint = BoxOfficeEndPoint(date: "20230501")

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = NetworkProvider(session: NetworkSession())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_API통신을통해_BoxOfficeDTO가_들어오는지() async {
        
        do {
            let result = try await sut.request(endPoint)
            
            switch result {
            case .success(let decodingData):
                XCTAssertNotNil(decodingData)
            case .failure(let error):
                XCTFail("API통신 실패! \(error)")
            }
        } catch {
            XCTFail("실패! \(error.localizedDescription)")
        }
    }
    
    func test_URLRequest가_잘만들어지는지() {
        
        do {
            let request = try endPoint.makeRequest()
            XCTAssertNotNil(request)
        } catch {
            XCTFail("실패! \(error.localizedDescription)")
        }
    }

}