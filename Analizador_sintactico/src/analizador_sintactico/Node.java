/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_sintactico;

import java.util.ArrayList;

/**
 *
 * @author Alex Ordonez
 */
public class Node {
    private String valor;
    private String token;
    private ArrayList<Node> subnodes;

    public Node() {
    }

    public Node(String token, String valor) {
        this.valor = valor;
        this.token = token;
        this.subnodes=new ArrayList<>();
    }
    
    public Node(String token) {
        this.token = token;
        this.valor = "NoTerminal";
        this.subnodes=new ArrayList<>();
    }

    public ArrayList<Node> getSubnodes() {
        return subnodes;
    }
    
    public void AddNode(Object o){
        if(o!=null){
            subnodes.add((Node)o);
        }else{
        }
    }

    public String getToken() {
        return token;
    }

    public String getValor() {
        return valor;
    }
    
    @Override
    public String toString() {
        if (valor.equals("NoTerminal")) {
            return token;
        }else{
            return valor;
        }
    }
    
    
}
