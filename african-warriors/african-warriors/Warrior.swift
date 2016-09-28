//
//  Warrior.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/28/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import Foundation

class Warrior {
    private var _name: String!
    private var _warriorId: Int!
    
    var name: String {
        return _name
    }
    
    var warriorId: Int {
        return _warriorId
    }
    
    init(name: String, warriorId: Int) {
        self._name = name
        self._warriorId = warriorId
    }
}
