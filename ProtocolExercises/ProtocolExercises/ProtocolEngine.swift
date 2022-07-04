//
//  ProtocolEngine.swift
//  ProtocolExercises
//
//  Created by Rivaldo Fernandes on 28/06/22.
//

import UIKit

protocol FuelEngineVehicle {
    
    var fuelTankCapacity: Int { get }
    var engineModel: String {get set}
    
    func start()
    
    func stop()
}

@objc protocol MaintainVehicle {
    @objc optional var bengkel: String {get}
    func gantiOli()
    func cekAnginBan() -> Int
}

extension FuelEngineVehicle {
    func stop(){
        print("Hello")
    }
}
