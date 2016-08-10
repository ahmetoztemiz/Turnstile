//
//  APIKeyCredentials.swift
//  Turnstile
//
//  Created by Edward Jiang on 7/28/16.
//
//

/**
 A struct representing an API Key ID / Secret pair. This can also be called
 a `client_id` and `client_secret`.
 */
public class APIKey: Credentials {
    /// The API Key ID
    public let id: String
    
    /// The API Key Secret
    public let secret: String
    
    /// Initialize the API Key with the ID and Secret
    public init(id: String, secret: String) {
        self.id = id
        self.secret = secret
    }
    
    deinit {
        secret.nulTerminatedUTF8.withUnsafeBufferPointer { (bufferPointer) -> Void in
            var pointer = UnsafeMutablePointer<UInt8>(bufferPointer.baseAddress)!
            
            for _ in 0..<bufferPointer.count {
                pointer = pointer.successor()
                pointer.pointee = 0
            }
        }
    }
}
