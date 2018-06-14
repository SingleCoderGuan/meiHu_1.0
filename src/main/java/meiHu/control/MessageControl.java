package meiHu.control;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

@ServerEndpoint("/messageReminding")
public class MessageControl {
    @OnOpen
    public void onOpen(Session session) throws IOException {
        //以下代码省略...
    }

    @OnMessage
    public String onMessage(String uid) {
        //以下代码省略...
        Integer userid = Integer.parseInt(uid) ;
        return ""+userid ;
    }


    @OnError
    public void onError(Throwable t) {
        //以下代码省略...
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        //以下代码省略...
    }

}

