//
//  File.swift
//  
//
//  Created by Alex Gavrikov on 2/18/21.
//

import NIOHTTP1

public struct HTTPRequest {
    public struct Headers<FieldName, FieldValue>: Sequence, ExpressibleByDictionaryLiteral, Codable {
        private struct Header: Codable {
            var FieldName: String
            var FieldValue: String
            
            init(_ field: (String, String)) {
                self.FieldName = field.0
                self.FieldValue = field.1
            }
        }
        private var raw: [Header]
        
        public init(dictionaryLiteral elements: (String, String)...) {
            var arr: [Header]
            arr = []
            for element in elements {
                arr.append(Header(element))
            }
            raw = arr
        }
        
        public init(dictionary dict: [String: String]) {
            var arr: [Header]
            arr = []
            for element in dict {
                arr.append(Header(element))
            }
            raw = arr
        }
        
        
        public var count: Int {
            get {
                return raw.count
            }
        }
        
        public var dict: Dictionary<String, String> {
            get {
                var dictionary = Dictionary<String, String>()
                for header in raw {
                    dictionary[header.FieldName] = header.FieldValue
                }
                return dictionary
            }
        }
        
        public func makeIterator() -> some IteratorProtocol {
            return raw.makeIterator()
        }
        
        public typealias FieldName = String
        
        public typealias FieldValue = String
    }
    
    public class Config {
        var method: HTTPMethod
        var url: String
        var headers: HTTPHeaders
        var version: HTTPVersion
        var body: [UInt8]?
        var trailHeaders: HTTPHeaders?
        
        init(method: HTTPMethod = .GET,
             url: String,
             headers: HTTPHeaders,
             version: HTTPVersion = HTTPVersion(major: 1, minor: 1),
             body: [UInt8],
             trailHeaders: HTTPHeaders?) {
            self.method = method
            self.url = url
            self.headers = headers
            self.version = version
            self.body = body
            self.trailHeaders = trailHeaders
        }
        
        
    }
    
    
}
