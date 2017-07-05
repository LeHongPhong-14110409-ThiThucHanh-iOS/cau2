////
////  bai5.swift
////  LeHongPhong_14110409_bai2
////
////  Created by PhongLe on 7/5/17.
////  Copyright © 2017 PhongLe. All rights reserved.
////
//
//import Foundation
//
//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//struct Person: FullyNamed {
//    var fullName = String()
//
//    var age: Int
//}
//
//class XYZ: FullyNamed {
//    
//    var prefix: String?
//    var name: String
//    
//    //DI
//    init(prefix: String, name: String) {
//        self.prefix = prefix
//        self.name = name
////        
////        if prefix.isEmpty {
////            if prefix.isEmpty {
////                self.fullName = name
////            }else{
////                self.fullName = "\(prefix) \(name)"
////            }
////        }
//    }
//    override var fullName =  { String in
//        return "\(self.prefix ?? "") \(self.name)"
//    }
//    
//}
