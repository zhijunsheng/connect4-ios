//
//  BoardView.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-10-29.
//

import UIKit

class BoardView: UIView {
    var originX: CGFloat = -1
    var originY: CGFloat = -1
    var cellSide: CGFloat = -1
    
    var shadowPiecesBox: Set<Conn4Piece> = []

    override func draw(_ rect: CGRect) {
        cellSide = bounds.width / 7
        originX = 0.5 * cellSide
        originY = 0.5 * cellSide
        
        drawBoard()
        drawPieces()
    }
    
    func colOf(x: CGFloat) -> Int {
        let col: Int = Int(x / cellSide)
        return col
    }
    
    func drawPieces() {
        for piece in shadowPiecesBox {
            drawCircleAt(col: piece.col, row: piece.row, color: piece.player == Conn4Player.red ? UIColor.red : UIColor.yellow)
        }
    }
    
    func drawBoard() {
        for row in 0 ..< 6 {
            for col in 0 ..< 7 {
                drawCircleAt(col: col, row: row, color: UIColor.white)
            }
        }
    }
    
    func drawCircleAt(col: Int, row: Int, color: UIColor) {
        let radius: CGFloat = 0.4 * cellSide
        let circle = UIBezierPath(arcCenter: CGPoint(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(5 - row) * cellSide), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        color.setFill()
        circle.fill()
        
        circle.stroke()
    }
}
