//
//  ViewController.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-10-29.
//

import UIKit
import MultipeerConnectivity

class Conn4ViewController: UIViewController {
    var conn4Board = Conn4Board()
    
    var peerID: MCPeerID!
    var session: MCSession!
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser!

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        
        boardView.shadowPiecesBox = conn4Board.piecesBox
    }
    
    @IBAction func dropPiece(_ sender: UITapGestureRecognizer) {
        let fingerX = sender.location(in: boardView).x
        let col = boardView.colOf(x: fingerX)
        conn4Board.dropAt(col: col)
        boardView.shadowPiecesBox = conn4Board.piecesBox
        boardView.setNeedsDisplay()
    }
    
    @IBAction func advertise(_ sender: UIButton) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "gt-conn4")
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }

    @IBAction func invite(_ sender: UIButton) {
        let browser = MCBrowserViewController(serviceType: "gt-conn4", session: session)
        browser.delegate = self
        present(browser, animated: true)
    }
}

extension Conn4ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print("\(peerID): connecting")
        case .connected:
            print("\(peerID): connected")
        case .notConnected:
            print("\(peerID): not connected")
        @unknown default:
            print("\(peerID): unknown state encountered: \(state)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
            
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension Conn4ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}

extension Conn4ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}
