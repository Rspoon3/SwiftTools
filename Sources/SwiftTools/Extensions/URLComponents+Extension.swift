//
//  URLComponents+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import Foundation

extension URLComponents{
    public init?(string: String, queryItems: [URLQueryItem]?){
        self.init(string: string)
        self.path = path
        self.queryItems = queryItems
    }
    
    public init?(string: String, queryItem: URLQueryItem?){
        self.init(string: string)
        self.path = path
        
        if let queryItem = queryItem {
            self.queryItems = [queryItem]
        }
    }
    
    public init?(scheme: String? = nil, host: String? = nil, path: String, query: String? = nil){
        self.init()
        self.scheme = scheme
        self.host = host
        self.path = path
        self.query = query
    }
}
