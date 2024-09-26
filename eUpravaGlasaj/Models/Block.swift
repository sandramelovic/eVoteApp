import Foundation
import CryptoKit

class Block: CustomStringConvertible {
    var index: Int
    var timestamp: Date
    var transactions: [String]
    var previousHash: String
    var hash: String
    
    var description: String {
            return "Index: \(index), Timestamp: \(timestamp), Transactions: \(transactions), PreviousHash: \(previousHash), Hash: \(hash)"
        }

    init(index: Int, timestamp: Date, transactions: [String], previousHash: String) {
        self.index = index
        self.timestamp = timestamp
        self.transactions = transactions
        self.previousHash = previousHash
        self.hash = Block.calculateHash(index: index, timestamp: timestamp, transactions: transactions, previousHash: previousHash)
    }

    static func calculateHash(index: Int, timestamp: Date, transactions: [String], previousHash: String) -> String {
        let data = "\(index)\(timestamp)\(transactions.joined())\(previousHash)"
        return SHA256.hash(data: Data(data.utf8)).map { String(format: "%02hhx", $0) }.joined()
    }
}
