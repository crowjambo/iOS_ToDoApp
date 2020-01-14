import XCTest
@testable import TodoListApp2

class TodoListApp2Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	// test whether new task gets added to collection
	func test_new_task_add_incrementation(){
		let vc = ViewController()
		vc.addTask(name: "test", description: "desc")
		XCTAssertEqual(vc.tasks.count, 1)
	}
	
	func test_new_task_multiple(){
		let vc = ViewController()
		for n in 1...100 {
			vc.addTask(name: "name"+String(n), description: "desc"+String(n))
		}
		XCTAssertEqual(vc.tasks.count, 100)
	}
	
	func test_update_task(){
		let vc = ViewController()
		//add some task first
		vc.addTask(name: "test", description: "desc")
		//update
		vc.updateTask(name: "newName", description: "newDesc", indexPath: 0)
		
		XCTAssertEqual(vc.tasks[0].name, "newName")
		XCTAssertEqual(vc.tasks[0].description, "newDesc")
	}
	
	func test_remove_task(){
		let vc = ViewController()
		//add some task first
		vc.addTask(name: "test", description: "desc")
		//remove
		vc.removeTask(idNumber: 0)
		
		XCTAssertEqual(vc.tasks.count, 0)
	}
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
