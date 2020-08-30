//
//  Network.swift
//  SwiftUI-Github-example
//
//  Created by Qilin on 2020/08/30.
//  Copyright © 2020 Ogawa Yuki. All rights reserved.
//

import Foundation
import Apollo

// MARK: - Singleton Wrapper

class Network {
  static let shared = Network()
  
  // Configure the network transport to use the singleton as the delegate.
  private lazy var networkTransport: HTTPNetworkTransport = {
    let transport = HTTPNetworkTransport(url: URL(string: "https://api.github.com/graphql")!)
    transport.delegate = self
    return transport
  }()
    
  // Use the configured network transport in your Apollo client.
  private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
    return true;
  }
  
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
                        
    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Authorization"] = ""
  
    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
  }
}
