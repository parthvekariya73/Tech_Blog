/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author Lenovo
 */
public class Message {
    private String content;
    private String type;
    private String CssClass;

    public Message(String content, String type, String CssClass) {
        this.content = content;
        this.type = type;
        this.CssClass = CssClass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return CssClass;
    }

    public void setCssClass(String CssClass) {
        this.CssClass = CssClass;
    }
    
    
}
