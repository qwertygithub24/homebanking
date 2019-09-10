package controller;

import homebanking.Session;
import java.util.ArrayList;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.util.Callback;
import model.dao.OperazioneDAO;
import model.entities.Operazione;
import util.TimeUtil;

public class GestioneOperazioniCliente {

    Operazione selectedOperazione=null;
    OperazioneDAO operazioneDAO=new OperazioneDAO();

    private ObservableList<Operazione> tblData = FXCollections.observableArrayList();
    
    @FXML
    private ComboBox<Operazione> cmbTipologia;

    @FXML
    private TextField txtImporto;

    @FXML
    private TextField txtCliente;
    
    @FXML
    private TextField txtBanca;
    
    @FXML
    private TextField txtFiliale;
    
    @FXML
    private DatePicker dtValuta;

    @FXML
    private TableView tblOperazioni;
    
    @FXML
    private Button btnInsert;
    
    @FXML
    private Button btnDelete;

   public GestioneOperazioniCliente(){
       
   }

   private void initialize(){
       initOperazioneTable();
       refreshTable();
       initCmbTipologia();
       
       txtCliente.setText(Session.getInstance().getAppUtente().getUsername());
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
   
   private void refreshFields(){
       txtImporto.setText(SelectedOperazione.getImporto());
       dtValuta.setValue(TimeUtil.convertDateToLocalDate(selectedOperazione.getData());
       
       if(selectedOperazione!=null){
           btnDelete.setDisable(false);
          
       }
   }

    
    private void refreshTable(){
        tblData.removeAll();
        tblData.clear();
        tblOperazioni.refresh();
        ArrayList<Operazione> listOperazioni= operazioneDAO.findByCliente(Session.getInstance().getSelectedUtente());
        tblData.addAll(listOperazioni);
        tblOperazioni.setItems(tblData);
        tblOperazioni.refresh();
    }
    
    public void insert(ActionEvent actionEvent) {
        Operazione o=new Operazione();
        o.setImporto(txtImporto.getText());
        o.setData_valuta(TimeUtil.convertLocalDateToDate(dtValuta.getValue()));
        o.setCliente(Session.getInstance().getSelectedUtente());
        
        operazioneDAO.insert(o);

        refreshTable();
    }
    
    public void delete(ActionEvent actionEvent) {
        if(selectedOperazione!=null) operazioneDAO.delete(selectedOperazione);
        refreshTable();
    }
    
    private void initCmbTipologia() {

        Callback<ListView<Operazione>, ListCell<Operazione>> cellFactory = new Callback<ListView<Operazione>, ListCell<Operazione>>() {
            @Override
            public ListCell<Operazione> call(ListView<Operazione> l) {
                return new ListCell<Operazione>() {
                    @Override
                    protected void updateItem(Operazione item, boolean empty) {
                        super.updateItem(item, empty);
                        if (item == null || empty) {
                            setGraphic(null);
                        } else {
                            setText(item.getId() + "---" + item.getTipologia());
                        }
                    }
                };
            }
        };
        cmbTipologia.setButtonCell(cellFactory.call(null));
        cmbTipologia.setCellFactory(cellFactory);

        ArrayList<Operazione> arrayListOperazioni=operazioneDAO.findAll();
        ObservableList<Operazione> options =FXCollections.observableArrayList(arrayListOperazioni);
        cmbTipologia.setItems(options);

    }

    public void changeCmbTipologia(ActionEvent e) {
        selectedOperazione=cmbTipologia.getValue();
        Session.getInstance().setSelectedOperazione(selectedOperazione);
    }
}
