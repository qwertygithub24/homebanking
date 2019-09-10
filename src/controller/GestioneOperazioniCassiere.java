package controller;

import homebanking.Session;
import java.util.ArrayList;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableView;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TablePosition;
import javafx.scene.control.TextField;
import model.dao.OperazioneDAO;
import model.entities.Operazione;
import model.entities.Servizio;
import model.entities.Utente;
import util.EmailProcessorThread;

public class GestioneOperazioniCassiere {

    Operazione selectedOperazione=null;
    OperazioneDAO operazioneDAO=new OperazioneDAO();
    
    private ObservableList<Operazione> tblData = FXCollections.observableArrayList();
    
    @FXML
    private ComboBox<Utente> cmbCliente;
    
    @FXML
    private ComboBox<String> cmbStato;
    
    @FXML
    private ComboBox<Servizio> cmbServizio;
    
    @FXML
    private ComboBox<String> cmbTipologiaOperazioneServizio;
    
    @FXML
    private ComboBox<String> cmbPeriodo;

    @FXML
    private Button btnConfirm;
    
    @FXML
    private Button btnCancel;
    
    @FXML
    private Button btnDelete;

    @FXML
    private TableView tblOperazioni;
    
    @FXML
    private Label lblCassiere;
    
    @FXML
    private Label lblBanca;
    
    @FXML
    private Label lblFiliale;

    public GestioneOperazioniCassiere(){
        
    }
    
    private void initialize(){
       initOperazioneTable();
       refreshTable();
       
       lblCassiere.setText(Session.getInstance().getAppUtente().getUsername());
       lblBanca.setText(Session.getInstance().getSelectedBanca().getNome());
       lblFiliale.setText(Session.getInstance().getSelectedFiliale().getNome());
       
   }
    
   private void initOperazioneTable(){
       tblOperazioni.setItems(tblData);
       tblOperazioni.getFocusModel().focusedCellProperty().addListener(
            new ChangeListener<TablePosition>(){
                @Override
                public void changed(ObservableValue<? extends TablePosition> observable,
                                    TablePosition oldPos, TablePosition pos){
                    int row=pos.getRow();
                    int column=pos.getColumn();
                    if(row > 0 && row < tblData.size()){
                        selectedOperazione = (Operazione) tblOperazioni.getItems().get(row);
                        Session.getInstance().setSelectedOperazione(selectedOperazione);
                     }
                }
            });
       refreshTable();
   }
   
   private void refreshTable(){
        tblData.removeAll();
        tblData.clear();
        tblOperazioni.refresh();
        ArrayList<Operazione> listOperazioni= operazioneDAO.findByCassiere(Session.getInstance().getSelectedUtente());
        tblData.addAll(listOperazioni);
        tblOperazioni.setItems(tblData);
        tblOperazioni.refresh();
    }
    
    public void confirm(ActionEvent actionEvent) {
        OperazioneDAO odao=new OperazioneDAO();
        selectedOperazione.setStato("confermata");
        boolean b_confirm=odao.update(selectedOperazione);
        if(b_confirm) sendConfirmedEmail(selectedOperazione);
        refreshTable();
    }

    public void delete(ActionEvent actionEvent) {
        if(selectedOperazione!=null)
        {
            boolean b_delete=operazioneDAO.delete(selectedOperazione);
            if(b_delete) sendDeletedEmail(selectedOperazione);
            refreshTable();
        }
    }

    public void cancel(ActionEvent actionEvent) {
        OperazioneDAO odao=new OperazioneDAO();
        selectedOperazione.setStato("annnullata");
        boolean b_cancel=odao.update(selectedOperazione);
        if(b_cancel) sendCanceledEmail(selectedOperazione);
        
        refreshTable();
    }
    
    private void sendCanceledEmail(Operazione op) {
        String strMsg="L'operazione "+
                op.getTipologia()+" "+
                op.getImporto()+"\n"+
                op.getData()+"\n"+
                "è stata rifiutata dal cassiere"+op.getCassiere().getNome()+" "+op.getCassiere().getCognome()+"\n"+
                "in data "+op.getData_conferma_cassiere();
        
        EmailProcessorThread ept=new EmailProcessorThread();
        ept.getSender().setBody(strMsg);
        ept.getSender().setTo(op.getCliente().getEmail());
        ept.start(); 
    }
    
    private void sendConfirmedEmail(Operazione op) {
        String strMsg="L'operazione "+
                op.getTipologia()+" "+
                op.getImporto()+"\n"+
                op.getData()+"\n"+
                "è stata confermata dal cassiere"+op.getCassiere().getNome()+" "+op.getCassiere().getCognome()+"\n"+
                "in data "+op.getData_conferma_cassiere();
        
        EmailProcessorThread ept=new EmailProcessorThread();
        ept.getSender().setBody(strMsg);
        ept.getSender().setTo(op.getCliente().getEmail());
        ept.start(); 
    }

    private void sendDeletedEmail(Operazione op) {
        String strMsg="L'operazione "+
                op.getTipologia()+" "+
                op.getImporto()+"\n"+
                op.getData()+"\n"+
                "è stata cancellata dal cassiere"+op.getCassiere().getNome()+" "+op.getCassiere().getCognome()+"\n"+
                "in data "+op.getData_conferma_cassiere();
        
        EmailProcessorThread ept=new EmailProcessorThread();
        ept.getSender().setBody(strMsg);
        ept.getSender().setTo(op.getCliente().getEmail());
        ept.start(); 
    }

}
