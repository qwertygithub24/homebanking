package controller;

import homebanking.Session;
import java.util.ArrayList;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableView;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import model.dao.OperazioneDAO;
import model.entities.Operazione;

public class GestioneOperazioniCassiere {

    Operazione selectedOperazione=null;
    OperazioneDAO operazioneDAO=new OperazioneDAO();
    
    private ObservableList<Operazione> tblData = FXCollections.observableArrayList();

    @FXML
    private Button btnComfirm;
    
    @FXML
    private Button btnCancel;
    
    @FXML
    private Button btnDelete;

    @FXML
    private TableView tblOperazioni;
    
    @FXML
    private TextField txtCassiere;
    
    @FXML
    private TextField txtBanca;
    
    @FXML
    private TextField txtFiliale;

    public GestioneOperazioniCassiere(){
        
    }
    
    private void initialize(){
       initOperazioneTable();
       refreshTable();
       
       txtCassiere.setText(Session.getInstance().getAppUtente().getUsername());
       txtBanca.setText(Session.getInstance().getSelectedBanca().getNome());
       txtFiliale.setText(Session.getInstance().getSelectedFiliale().getNome());
       
   }
    
   private void initOperazioneTable(){
       tblOperazioni.setItems(tblData);
       tblOperazioni.getFocusModel().focusedCellProperty().addListener(
            new ChangeListener<TablePosition>(){
                @Override
                public void changed(ObservableValue<? extend TablePosition> observable,
                                    TablePosition oldPos, TablePosition pos){
                    int row=pos.getRow();
                    int column=pos.getColumn();
                    if(row > 0 && < tblData.size()){
                        selectedOperazione = (Operazione) tblOperazioni.getItems().get(row);
                        Session.getInstance().setSelectedOperazione(selectedOperazione);
                        refreshFields();
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
    
    public void btnConfirm(ActionEvent actionEvent) {
    }

    public void btnDelete(ActionEvent actionEvent) {
        if(selectedOperazione!=null) operazioneDAO.delete(selectedOperazione);
        refreshTable();
    }

    public void btnCancel(ActionEvent actionEvent) {
    }
}
