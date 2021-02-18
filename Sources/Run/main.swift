//
//  main.swift
//  
//
//  Created by Alex Gavrikov on 2/18/21.
//

import Foundation
import MediaShadow
import struct MediaShadow.HTTPRequest

print("I'm up!")
let a = MediaShadow()
print(a.text)

let b = HTTPRequest.Headers<String, String>(dictionary: ["content-type": "application/json", "accept": "text/plain"])
print(b)
print(b.count)
print(b.dict)
print(b.dict["accept"] ?? "")
