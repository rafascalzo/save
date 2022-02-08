//
//  User.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import Foundation
import UIKit


class User {
    
    private var id: Int
    private var name: String
    private var account: Account
    
    public init(id: Int, name: String, account: Account) {
        self.id = id
        self.name = name
        self.account = account
    }
    
}

class Account {
    
    private var deposits: Float80
    private var donated: Float80
    private var donations: Float80
    private var creditLimit: Float80
    private var borrowed: Float80
    private var balance: Float80
    
    public init(_ deposits: Float80,_ donated: Float80, _ donations: Float80, _ creditLimit: Float80, _ borrowed: Float80, _ balance: Float80) {
        self.deposits = deposits
        self.donated = donated
        self.donations = donations
        self.creditLimit = creditLimit
        self.borrowed = borrowed
        self.balance = balance
    }
}
