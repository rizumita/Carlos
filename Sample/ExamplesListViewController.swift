import Foundation
import UIKit

struct ExamplesListSection {
  let name: String
  let samples: [Example]
}

struct Example {
  let name: String
  let shortDescription: String
  let segueIdentifier: String
}

class ExamplesListViewController: UIViewController {
  private let sections = [
    ExamplesListSection(name: "Simple", samples: [
      Example(name: "Image cache", shortDescription: "Out-of-the-box image cache", segueIdentifier: "imageCache"),
      Example(name: "Data cache", shortDescription: "Out-of-the-box data cache", segueIdentifier: "dataCache"),
      Example(name: "JSON cache", shortDescription: "Out-of-the-box JSON cache", segueIdentifier: "jsonCache"),
      Example(name: "User defaults cache", shortDescription: "Out-of-the-box NSUserDefaults cache", segueIdentifier: "userDefaultsCache"),
      Example(name: "Memory warnings", shortDescription: "Simple stack with memory warnings listeners", segueIdentifier: "memoryWarning")
    ]),
    ExamplesListSection(name: "Advanced", samples: [
      Example(name: "Complex cache", shortDescription: "Custom stack with key and value transformations", segueIdentifier: "complexCache"),
      Example(name: "Conditioned cache", shortDescription: "Simple stack with conditioned levels", segueIdentifier: "conditionedCache"),
      Example(name: "Pooled cache", shortDescription: "Simple stack with requests pooling", segueIdentifier: "pooledCache"),
      Example(name: "Capped cache", shortDescription: "Simple stack with requests capping", segueIdentifier: "cappedCache"),
      Example(name: "Switched cache", shortDescription: "2 Simple switched lanes", segueIdentifier: "switchedCache")
    ])
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Carlos Samples"
  }
}

extension ExamplesListViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].samples.count
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].name
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(ExampleCell.Identifier, forIndexPath: indexPath) as! ExampleCell
    
    cell.configureWithExample(sections[indexPath.section].samples[indexPath.row])
    
    return cell
  }
}

extension ExamplesListViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let example = sections[indexPath.section].samples[indexPath.row]
    
    performSegueWithIdentifier(example.segueIdentifier, sender: self)
  }
}