//
//  Vehicle.swift
//  ProtocolExercises
//
//  Created by Rivaldo Fernandes on 28/06/22.
//

import UIKit

class Car: FuelEngineVehicle, MaintainVehicle {
    var bengkel: String = "Bengkel Number Wan"
    
    func gantiOli() {
        print("ganti oli mesin")
    }
    
    func cekAnginBan() -> Int {
        return 33
    }
    
    var engineModel: String = "Matic"
    
    var name: String?
    var setCapacity: Int?
    var fuelTankCapacity: Int = 100
    
    func start() {
        print("mobilnya jalan")
    }
    
    func stop() {
        print("mobilnya berhenti")
    }
    
    
}

class Motorcycle: FuelEngineVehicle, MaintainVehicle {
    var bengkel: String = "Bengkel Number Tu"
    
    func gantiOli() {
        print("ganti oli samping")
    }
    
    func cekAnginBan() -> Int {
        return 29
    }
    
    var engineModel: String = "Kopling"
    
    var name: String?
    var fuelTankCapacity: Int = 20
    
    func start() {
        print("motornya distarter")
    }
    
    func stop() {
        print("motornya diberhentikan")
    }
    
    
}
