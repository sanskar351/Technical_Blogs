/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.category;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sanskar Kumar
 */
public class postdao {
    
    Connection con;

    public postdao(Connection con) {
        this.con = con;
    }
    public ArrayList<category> getallcategory()
    { ArrayList<category> list=new ArrayList<>();
        try{
            String query="select * from categories";
            Statement s=this.con.createStatement();
            ResultSet set=s.executeQuery(query);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                category c=new category(cid,name,description);
                list.add(c);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
       public boolean savepost(com.tech.blog.entities.post post)
            {
                boolean f=false;
                try
                {
                    String query="insert into posts(ptitle,pcontent,pcode,ppic,userid) values(?,?,?,?,?)";
                    PreparedStatement ps=con.prepareStatement(query);
              
                    ps.setString(1, post.getPtitle());
                    ps.setString(2, post.getPcontent());
                    ps.setString(3, post.getPcode());
                    ps.setString(4, post.getPpic());
                   
                    ps.setInt(5, post.getUserid());
                    ps.executeUpdate();
                    f=true;
                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
     
               return f; 
                
    }
    
public List<com.tech.blog.entities.post> showpost(int useri)
{
    
 List<com.tech.blog.entities.post> p=new ArrayList<>(); 
 com.tech.blog.entities.post  po=null;
 try{
     
     String h="select * from posts where userid=?";
     PreparedStatement s=con.prepareStatement(h);
    s.setInt(1, useri);
     ResultSet rs=s.executeQuery();
     while(rs.next())
     { po=new com.tech.blog.entities.post();
        int pid=rs.getInt("pid");
        String ptitle=rs.getString("ptitle");
        String pcontent=rs.getString("pcontent");
        String pcode=rs.getString("pcode");
        String ppic=rs.getString("ppic");
        Timestamp pdate=rs.getTimestamp("pdate");
        int userid=rs.getInt("userid");
        post p1=new post(pid,ptitle,pcontent,pcode,ppic,pdate,userid);
        p.add(p1);
       
       
     }
 }
 catch(Exception e)
 {
     e.printStackTrace();
 }
 return p;
}
public post getbypost(int postid)
{ post o=null;
    String q="select * from posts where pid=?";
    try{
        
    
    PreparedStatement ps=con.prepareStatement(q);
    ps.setInt(1, postid);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
      
               
int pid=rs.getInt("pid");
        String ptitle=rs.getString("ptitle");
        String pcontent=rs.getString("pcontent");
        String pcode=rs.getString("pcode");
        String ppic=rs.getString("ppic");
        Timestamp pdate=rs.getTimestamp("pdate");
        int userid=rs.getInt("userid");
        o=new post(pid,ptitle,pcontent,pcode,ppic,pdate,userid);
     }
   }
    
    catch(Exception e)
    {
       e.printStackTrace();
    }
    return o;
}
public boolean updatepost(com.tech.blog.entities.post p)
{
    boolean f=false;
    try{
        String query="update posts set ptitle=? , pcontent=? , pcode=? , ppic=? where pid=?";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, p.getPtitle());
        ps.setString(2, p.getPcontent());
        ps.setString(3, p.getPcode());
        ps.setString(4, p.getPpic());
        ps.setInt(5, p.getPid());
        ps.executeUpdate();
        f=true;
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
  return f;  
}

public boolean deletenotes(int Id)
{
    boolean f=false;
    try
    { String i="delete from posts where pid=?";
    PreparedStatement ps=con.prepareStatement(i);
    ps.setInt(1, Id);
    int z=ps.executeUpdate();
     if(z==1)
     {
         f=true;
     }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return f;
}



}
