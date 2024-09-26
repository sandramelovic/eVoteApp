//
//  VoteViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit
import Parse

class AdminViewController: UIViewController {
    
    let adminView = AdminScreen()
    var candidateName: String?
    var blockchain = Blockchain()
    
    override func loadView() {
        view = adminView
        
    }
    
    let candidates: [Candidate] = [
        Candidate(name: "Ana Marković", dateOfBirth: "15. januar 1985.", profession: "Advokat", contact: "ana.markovic@example.com", group: "Stranka pravde i napretka", biography: "Ana Marković je diplomirala pravo na Univerzitetu u Beogradu. Posvećena je borbi za pravdu i transparentnost u politici.", motive: "Želim da unapredim život građana kroz efikasnije zakonodavstvo."),
        Candidate(name: "Petar Jovanović", dateOfBirth: "3. mart 1978.", profession: "Ekonomista", contact: "petar.jovanovic@example.com", group: "Demokratska stranka", biography: "Petar Jovanović je magistrirao ekonomiju na Ekonomskom fakultetu. Ima dugogodišnje iskustvo u finansijskom sektoru.", motive: "Spreman sam da se izborim za ekonomski razvoj naše zajednice."),
        Candidate(name: "Milica Nikolić", dateOfBirth: "20. april 1990.", profession: "Učiteljica", contact: "milica.nikolic@example.com", group: "Liga socijaldemokrata Vojvodine", biography: "Milica Nikolić je diplomirala pedagogiju i radi kao učiteljica u osnovnoj školi. Posvećena je obrazovanju dece i mladih.", motive: "Želim da unapredim obrazovni sistem i obezbedim bolje uslove za učenje."),
        Candidate(name: "Stefan Pavlović", dateOfBirth: "5. jul 1980.", profession: "Preduzetnik", contact: "stefan.pavlovic@example.com", group: "Srpska napredna stranka", biography: "Stefan Pavlović je osnivač i direktor uspešne IT kompanije. Zagovara privredni razvoj i inovacije.", motive: "Spreman sam da unapredim poslovni ambijent i podržim razvoj digitalne ekonomije."),
        Candidate(name: "Jelena Stojanović", dateOfBirth: "10. septembar 1982.", profession: "Medicinska sestra", contact: "jelena.stojanovic@example.com", group: "Socijalistička partija Srbije", biography: "Jelena Stojanović radi kao medicinska sestra u lokalnoj bolnici. Posvećena je zdravlju i dobrobiti pacijenata.", motive: "Želim da unapredim zdravstveni sistem i obezbedim bolje uslove za lečenje."),
        Candidate(name: "Nenad Đorđević", dateOfBirth: "25. februar 1975.", profession: "Inženjer građevinarstva", contact: "nenad.djordjevic@example.com", group: "Narodna stranka", biography: "Nenad Đorđević je diplomirani inženjer građevinarstva. Ima iskustvo u urbanističkom planiranju i infrastrukturnim projektima.", motive: "Spreman sam da se izborim za bolje urbanističko planiranje i infrastrukturne projekte."),
        Candidate(name: "Marija Janković", dateOfBirth: "12. avgust 1987.", profession: "Novinar", contact: "marija.jankovic@example.com", group: "Pokret slobodnih građana", biography: "Marija Janković je iskusna novinarka koja se zalaže za slobodu medija i transparentnost u društvu.", motive: "Želim da se izborim za nezavisno novinarstvo i pravnu državu."),
        Candidate(name: "Marko Stanić", dateOfBirth: "7. jun 1995.", profession: "Student", contact: "marko.stanic@example.com", group: "Studentska organizacija", biography: "Marko Stanić je student političkih nauka i aktivista. Posvećen je poboljšanju uslova za studente i mlade.", motive: "Želim da se izborim za pravednije uslove studiranja i veću podršku mladima."),
        Candidate(name: "Ana Petrović", dateOfBirth: "18. mart 1983.", profession: "Doktor medicine", contact: "ana.petrovic@example.com", group: "Zdrava Srbija", biography: "Ana Petrović je specijalista opšte medicine koja se bavi preventivnim zdravstvom. Zagovara zdrav način života i prevenciju bolesti.", motive: "Spremna sam da se izborim za bolje uslove zdravstvene zaštite i podignem svest o prevenciji bolesti."),
        Candidate(name: "Nikola Jovanović", dateOfBirth: "30. januar 1988.", profession: "Advokat", contact: "nikola.jovanovic@example.com", group: "Napredna stranka", biography: "Nikola Jovanović je advokat koji se bavi građanskim pravom. Aktivno se zalaže za zaštitu ljudskih prava i pravnu sigurnost.", motive: "Želim da unapredim pravni sistem i osiguram pravičnost za sve građane.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adminView.adminTableView.delegate = self
        self.adminView.adminTableView.dataSource = self
        
        let logoutButton = adminView.logoutButton
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped(_:)), for: .touchUpInside)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hidesBottomBarWhenPushed = false
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        let welcomeViewController = WelcomeViewController()
        PFUser.logOut()
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

extension AdminViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return candidates.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.adminTableViewCell, for: indexPath) as? AdminTableViewCell {
                 if !candidates.isEmpty {
                     let candidate = candidates[indexPath.section]
                     cell.candidateLabel.text = candidate.name
                     cell.groupLabel.text = candidate.group
                     
                     let candidateName = cell.candidateLabel.text
                     let query = PFQuery(className: "_User")
                     query.whereKey("vote", equalTo: candidateName)
                     query.countObjectsInBackground { (count, error) in
                         if error == nil {
                             DispatchQueue.main.async {
                                 cell.votes.text = "\(count)"
                             }
                         } else {
                             DispatchQueue.main.async {
                                 cell.votes.text = "0"
                             }
                         }
                     }
                 }
                 return cell
         }
         return UITableViewCell()
     }
     
 }
