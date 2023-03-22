//
//  ViewController.swift
//  MoEngageTest
//
//  Created by Rakshitha on 17/03/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model: NewsList?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = ViewController.getNewsData() else {
            print("Not able to get data")
            return
        }
        
        self.model = model
        tableView.reloadData()
    }
}

private extension ViewController {
    
    static func getNewsData() -> NewsList? {
        guard let data = NewsHelper.fetchNewsData() else {
            print("Not able to fetch data")
            return nil }
        
        do {
            let model = try JSONDecoder().decode(NewsList.self, from: data)
            return model
        } catch {
            print("Parse Error: \(error)")
        }
        
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.articles.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.newsCell.rawValue, for: indexPath) as? NewsTableViewCell,
                let model = model
                 else { return UITableViewCell() }
        if model.articles.count < indexPath.row { return cell }
        let modelData = model.articles[indexPath.row]
        cell.articleTitle.text = modelData.title
        cell.articleDescription.text = modelData.description
        cell.publishedDate.text = modelData.publishedAt
        guard let url = URL(string: modelData.urlToImage) else { return cell }
        cell.articleImage.kf.setImage(with: url)

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
