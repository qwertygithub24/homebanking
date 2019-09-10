package homebanking;

import javafx.application.Application;
import javafx.stage.Stage;

public class App extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Session.getInstance().openGraphicInterface("Home Banking","fxml/login.fxml");
    }


    public static void main(String[] args) {
        launch(args);
    }
}
