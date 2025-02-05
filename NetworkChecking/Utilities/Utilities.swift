//
//  Utilities.swift
//  NetworkChecking
//
//  Created by mac on 10/3/24.
//

import Foundation
import Network

class Utilities:ObservableObject {
    @Published var isConn:Bool = true
    
    func monitorNetwork() {
        let monitor: NWPathMonitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                OperationQueue.main.addOperation {
                    self.isConn = true
                }
            }else if path.status == .requiresConnection {
                OperationQueue.main.addOperation {
                    self.isConn = false
                }
            }else{
                OperationQueue.main.addOperation {
                    self.isConn = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
