//
//  main.swift
//  Dijkstra
//
//  Created by Clément GARBAY on 31/01/2016.
//  Copyright © 2016 Clément GARBAY. All rights reserved.
//

import Foundation

let data: [String: [String: Double]] = ["a": ["d": 5, "e": 7, "b": 2], "b": ["e": 4, "c": 9], "c": ["e": 4, "g": 6], "d": ["e": 3, "f": 5], "e": ["f": 3, "g": 4], "f": ["h": 5], "g": ["h": 3]]

let graph = Graph(graph: data)
print(graph.findShortestPath("a", end: "h")) // (["a", "b", "e", "g", "h"], 13)
print(graph.findShortestPath("a", end: "e")) // (["a", "b", "e"], 6.0)

// TODO : Problem when no path found. Incorrect result
print(graph.findShortestPath("b", end: "d"))

let data2: [String: [String: Double]] = ["a": ["d": 2, "g": 2], "b": ["a": 1], "c": ["b": 1, "f": 2, "g": 3], "d": ["g": 4, "s": 7], "e": ["a": 5, "b": 3, "c": 2], "f": ["d": 1, "s": 6], "g": ["f": 4]]

print(Graph.findShortestPath(data2, start: "e", end: "s")) // (["e", "c", "f", "s"], 10)
