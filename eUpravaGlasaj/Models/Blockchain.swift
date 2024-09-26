import Foundation
import CryptoKit

class Blockchain {
    var chain = [Block]()
    var currentTransactions: [String] = []

    init() {
        // Initialize the blockchain and add the genesis block
        chain = []
        appendGenesisBlock()
    }

    private func createGenesisBlock() -> Block {
        return Block(index: 0, timestamp: Date(), transactions: ["Genesis Block"], previousHash: "0")
    }

    private func appendGenesisBlock() {
        if chain.isEmpty {
            let genesisBlock = createGenesisBlock()
            chain.append(genesisBlock)
        }
    }

    func getLatestBlock() -> Block {
        // Ensure the chain is not empty before accessing
        guard !chain.isEmpty else {
            fatalError("Blockchain is empty. Cannot retrieve the latest block.")
        }
        return chain[chain.count - 1]
    }

    func addBlock(transactions: [String]) {
        // Ensure the chain is not empty before adding a new block
        guard !chain.isEmpty else {
            print("Error: Blockchain is empty. Cannot add a new block.")
            return
        }
        
        let previousBlock = getLatestBlock()
        let newBlock = Block(index: previousBlock.index + 1, timestamp: Date(), transactions: transactions, previousHash: previousBlock.hash)
        chain.append(newBlock)
    }

    func isChainValid() -> Bool {
        for i in 1..<chain.count {
            let currentBlock = chain[i]
            let previousBlock = chain[i - 1]

            if currentBlock.hash != Block.calculateHash(index: currentBlock.index, timestamp: currentBlock.timestamp, transactions: currentBlock.transactions, previousHash: currentBlock.previousHash) {
                return false
            }

            if currentBlock.previousHash != previousBlock.hash {
                return false
            }
        }
        return true
    }
    
    func getVoteCount(for candidateName: String) -> Int {
        var count = 0
        for block in chain {
            for transaction in block.transactions {
                print("Transaction: \(transaction)")
                if transaction.contains(candidateName) {
                    count += 1
                }
            }
        }
        return count
    }
    
    func reset() {
            chain.removeAll()
            appendGenesisBlock() // Optionally re-add the genesis block
            print("Blockchain has been reset.")
        }
}
