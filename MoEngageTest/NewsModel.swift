//
//  NewsModel.swift
//  MoEngageTest
//
//  Created by Ram Voleti on 28/04/22.
//

import Foundation

// MARK: - Abc
struct NewsList: Codable {
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
    
//    enum CodingKeys: CodingKey {
//        case description = "articleDescription"
//        case source, author, title, url, urlToImage, publishedAt, content
//    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
