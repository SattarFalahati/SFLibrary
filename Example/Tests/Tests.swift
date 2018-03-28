import XCTest
import SFLibrary

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_roundImage()
    {
        let testImgView = UIImageView()
        testImgView.roundViewWith(borderColor: .red, borderWidth: 2)
        XCTAssert(testImgView.layer.borderWidth == 2)
        
    }
    
 
    
}
