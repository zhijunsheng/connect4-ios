//
//  Conn4Tests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-13.
//

import XCTest
@testable import ConnectFourBoard

class Conn4Tests: XCTestCase {

    func testConn4BoardDescription() {
        var conn4Board = Conn4Board()
        conn4Board.dropAt(col: 3, player: .red)
        conn4Board.dropAt(col: 5, player: .yellow)
        print(conn4Board)
        
    }

}
