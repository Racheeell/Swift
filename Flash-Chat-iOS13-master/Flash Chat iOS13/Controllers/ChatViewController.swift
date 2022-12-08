//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    //variavel que vai conter uma matriz de objetos de mensagem
    var messages: [Message] = [
        Message(sender: "bob@ibm.com", body: "Hey!"),
        Message(sender: "rachellima.bol@hotmail.com", body: "Hi"),
        Message(sender: "1@2.com", body: "Olá!"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        //ira ocultar o botao de voltar da tela do chat
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil),
                forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    /*Sempre que ha uma alteracao no banco de dados, aciona esse fechamento que esvazia a matriz de mensagens e adiciona todas as novas mensagens de volta a matriz de mensagens. Portanto, é onde chama e recarrega os dados para acionar esses dois metodos delegate e coloca as celulas em nossa exibicao de tabela*/
    func loadMessages()
    {
        //acessar o banco de dados
        //db.collection(K.FStore.collectionName).getDocuments {(querySnapshot, error) in
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener {(querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("Ocorreu um problema ao recuperar os dados do FireStore, \(e)")
            }
            else
            {
                /*querySnapshot é um instancia de consulta opcional
                querySnapshot?.documents[0].data()[K.FStore.senderField]
                 O "if let " para vincular esses documentos se eles existirem para uma nova constante
                o snapshot é uma matriz de QueryDocumentsSNapshots e agora esta totalmente desembrulhado
                 
                 criar um loop for e dizer, para o doc em snapshotsDocuments, para cada um desses documentos, vamos adiante e imprimir o documento.dados e esse dados agora sao um par de valores-chave
                 */
                if let snapshotDocuments = querySnapshot?.documents
                {
                    //Esta percorrendo todos os documentos dentro dessa matriz, e para cada um deles, estamos acessando o objeto de dados e imprimindo aqui.
                    for doc in snapshotDocuments {
                        //print(doc.data())
                        let data = doc.data()
                        //pode dividir esse dados no valor do remetente e no valor do corpo
                        // pode -se dizer que remetente = dados, e da para acessar o valor usando colchetes, pq é um dicionario e,
                        if let messageSender = data[K.FStore.senderField] as? String,
                           let messageBody = data[K.FStore.bodyField] as? String
                        {
                            //criando uma nova mensagem e para propriedade do remetente
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //se quiser rolar ate a parte inferior da tela da tabela toda vez que houver uma nova mensagem adicionada, tudo o que precisa fazer é chamar o metodo que seja self.
                                let indexPath = IndexPath(row: self.messages.count, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                            
                            //podera acessar o tableview e acionar esses metodos de donte de ddaods
                           
                        }
                        /*quando esta usando dicionario e tentando recuperar coisas de dicionario, porque
                         estamos usando uma string para recuperar esses dados e eles podem obviamentes ser
                         erros de digitacao de string , entao o item que sair ou o valor será, novamente
                         um opcional. E pior ainda, nao é apenas um opcional, mas nem sabemos qual é o tipo de dado, porque esses dados tem o tipo "Qualquer". E o motivo é que o Firebase nos permite armazenar varios tipos de dados diferentes no banco de dados.
                         Entao, sabendo que os dados do remetente serao uma string. EM vez de ter um
                         "Any"(Qualquer) opcional, usa-se o downcast(as?) condicional para converte-lo
                         em uma string. Ou seja, tera uma sequencia opcional. Portanto, desde que possa recuperar o senderField dos dados, deve terminar com algum tipo de string.
                         Usando o "if let" para vincular esse remetente a esse valor aqui data[K.FStore.senderField] as? String
                            
                         */
                        
                    }
                }
            }
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email
        {
            db.collection(K.FStore.collectionName).addDocument(
                data: [K.FStore.senderField: messageSender,
                       K.FStore.bodyField: messageBody,
                       //ordenar as mensagem
                       K.FStore.dateField: Date().timeIntervalSince1970])
            { (error) in
                if let e = error {
                    print("Ocorreu um problema ao salvar os dados no FireStore, \(e)")
                }
                else {
                    print("Dados salvos com sucesso !!!")
                    //limpa o campo de texto depois que enviou a mensagem
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }}
            }
        }
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        //let firebaseAuth = Auth.auth()
        do {
          //try firebaseAuth.signOut()
            try Auth.auth().signOut()
            //o popToRoot se livra de todos os controles de exibicao da pilha, exceto o proprio root
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
      
    }
    
}


extension ChatViewController: UITableViewDataSource {
    //esse metodo tableView cell for... é chamado quantas vezes houver células
    //Ou seja, estamos dizendo para criar o numero de células que correspondem ao numero de mensagens e, para cada uma dessas células, chame esse método para descobrir o que precisa ser exibido nela.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    /*Para saber todas as propriedades dessa classe especifica MessageCall, precisa usar "as!"
     palavra-chave para converter esta célula reutilizavel  como uma  classe de célula da mensagem
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //crie uma nova messagem dde codigo constante, e configura-la para a mensagem atual na linha indexPath da matriz de mensagens
        let message = messages[indexPath.row]
      
        /*Ele retorna  um objeto de celula reutilizavel para o identificador de reutilizacao especificado e adiciona-lo a tabela
         Qual é o identificador de reutilizacao?
         Definimos na celula prototipo  de exibicao de tabela, se selecionar o ReusableCell e for ao inspetor de atributos.*/
        let cell = tableView.dequeueReusableCell(withIdentifier:
            K.cellIdentifier, for: indexPath)
        
        /*Isso significa que quando o tableView estiver solicitando os
         dados para a linha 0, sera igual a zero, e exibira a mensagem na posicao 0
         A propriedade body dessa mensagem seja inserida no textLabel da celula*/
        as! MessageCell
        //cell.label.text = messages[indexPath.row].body
        cell.label.text = message.body
        
        /*E para obter a propriedade remetente da mensagem, podemos simplesmente enviar uma mensagem*/
        //Esta é uma mensagem do usuario atual
        if message.sender == Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden = true
            //garantir que o right... n esteja oculto
            cell.rightImageView.isHidden = false
            //mudar a cor de fundo da celula
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            //mudar a cor do texto dos rotulos
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        //Esta é uma mensagem de outro remetente
        else{
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
}
    /*A diferenca de do UITableViewDataSource é que é a fonte de dados e o protocolo responsavel por preencher o tableView, informando quantas celulas ele precisa e quais celulas colocam no tableView.Mas tambem podemos criar
     
     UMA EXTENSAO PARA O CHATVIEWCONTROLLER QUE TENHA  O PROTOCOLO DO UITABLEVIEWDELEGATE ADOTADO.
    
     COMO DIFERENCIAR O REMETENTE DO DESTINATARIO?
     No local em que carrega a células para o tableView, verifica se o remetente da mensagem que esta entrando na célula é o mesmo que o usuario conectado no momento. E nesse caso, significa que essa mensagem atual que está sendo carregada, essa célula atual, pertence ao usuario atual e, nesse caso, mostrará esse estilo especifico de célula. Mas se o usuario da mensagem nao for o mesmo que o usuario atual, mostraremos esse estilo de mensagem.
     */
    




