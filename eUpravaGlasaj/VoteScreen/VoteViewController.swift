//
//  VoteViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit

class VoteViewController: UIViewController {
    
    let voteView = VoteScreen()
    var candidateName: String?
    
    override func loadView() {
        view = voteView
        
        let voteButton = voteView.voteButton
        let backButton = voteView.voteSteps?.backButton
        let step2 = voteView.voteSteps?.step2
        let identificationLabel = voteView.voteSteps?.identificationLabel
        let logoutButton = voteView.voteSteps?.logoutButton
        
        step2?.backgroundColor = UIColor(hex: 0x085b9e)
        identificationLabel?.text = "Корак 2: Гласај"
        
        voteButton.addTarget(self, action: #selector(voteButtonTapped(_ :)), for: .touchUpInside)
        backButton?.isHidden = true
        logoutButton?.isHidden = true
        
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
        
        self.voteView.candidateTableView.delegate = self
        self.voteView.candidateTableView.dataSource = self
        
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
    
    @objc func voteButtonTapped(_ sender:UIButton){
        guard let candidateName = candidateName else {
            let alertController = UIAlertController(title: "Грешка", message: "Морате одабрати кандидата пре потврде.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let confirmViewController = ConfirmViewController()
        confirmViewController.confirmView.candidateLabel.text = candidateName
        
        navigationController?.pushViewController(confirmViewController, animated: true)
    }
    
}

extension VoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return candidates.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.candidateTableViewCell, for: indexPath) as? CandidateTableViewCell {
            if !candidates.isEmpty {
                let candidate = candidates[indexPath.section]
                cell.candidateLabel.text = candidate.name
                cell.groupLabel.text = candidate.group
                
                cell.candidateDetailButton.addTarget(self, action: #selector(candidateDetailLabelTapped(_:)), for: .touchUpInside)
            
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? CandidateTableViewCell {
            
            cell.radioButton.isSelected = true
            cell.candidateDetailButton.addTarget(self, action: #selector(candidateDetailLabelTapped(_:)), for: .touchUpInside)
            
        }
        
        let name = candidates[indexPath.section].name
        candidateName = name
        
        let candidateDetailViewController = CandidateDetailViewController()
        
        candidateDetailViewController.candidateDetailView.nameLabel.text = candidates[indexPath.section].name
        candidateDetailViewController.candidateDetailView.dateOfBirthLabel.text = candidates[indexPath.section].dateOfBirth
        candidateDetailViewController.candidateDetailView.professionLabel.text = candidates[indexPath.section].profession
        candidateDetailViewController.candidateDetailView.contactLabel.text = candidates[indexPath.section].contact
        candidateDetailViewController.candidateDetailView.groupLabel.text = candidates[indexPath.section].group
        candidateDetailViewController.candidateDetailView.biographyLabel.text = candidates[indexPath.section].biography
        candidateDetailViewController.candidateDetailView.motiveLabel.text = candidates[indexPath.section].motive
        
        navigationController?.pushViewController(candidateDetailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        guard tableView.indexPathsForSelectedRows?.count ?? 0 == 1 else { return indexPath}
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) as? CandidateTableViewCell {
            
            cell.radioButton.isSelected = !cell.radioButton.isSelected
            
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    @objc func candidateDetailLabelTapped(_ sender:UIButton){
        let candidateDetailScreen = CandidateDetailViewController()
        navigationController?.pushViewController(candidateDetailScreen, animated: true)
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 10,
        bottom: 10,
        right: 20
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
