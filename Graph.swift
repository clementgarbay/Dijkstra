//
//  Graph.swift
//  Dijkstra
//
//  Created by Clément GARBAY on 31/01/2016.
//  Copyright © 2016 Clément GARBAY. All rights reserved.
//

import Foundation

class Graph {
    
    var graph: [String: [String: Double]]
    
    init(graph: [String: [String: Double]]) {
        self.graph = graph
    }
    
    func findShortestPath(start: String, end: String) -> ([String], Double) {
        return Graph.findShortestPath(self.graph, start: start, end: end)
    }
    
    static func findShortestPath(graph: [String: [String: Double]], start: String, end: String) -> ([String], Double) {
        var predecessors = [String: String]()
        var distances = [String: Double]()
        distances[start] = 0
        
        var processed = Set<String>()
        var current: String = start
        
        // While all vertex are not processed
        while processed.count != graph.keys.count-1 {
            processed.insert(current)
            
            // For each successors of the current node
            for (vertex, distance) in graph[current]! {
                if predecessors[vertex] == nil {
                    predecessors[vertex] = current
                }
                
                if !processed.contains(vertex) {
                    var newDistance: Double = distance
                    if distances[current] != nil {
                        newDistance += distances[current]!
                    }
                    
                    if distances[vertex] == nil {
                        distances[vertex] = newDistance
                    } else if newDistance < distances[vertex] {
                        distances[vertex] = newDistance
                        predecessors[vertex] = current
                    }
                }
            }
            
            // Find the next vertex
            let notProcessed = Set(graph.keys).subtract(processed)
            var minDistance: Double = Double.infinity
            current = notProcessed.first!
            for node in notProcessed {
                if distances[node] != nil && distances[node] < minDistance {
                    minDistance = distances[node]!
                    current = node
                }
            }
        }
        
        // Constructs the shortest path
        current = end
        var path: [String] = []
        while current != start && predecessors[current] != nil {
            path.append(current)
            current = predecessors[current]!
        }
        path.append(start)
        path = path.reverse()
        
        return (path, distances[end]!)
    }
}