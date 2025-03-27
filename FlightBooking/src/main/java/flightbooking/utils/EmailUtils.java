/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.utils;

import java.util.Date;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ADMIN
 */
public class EmailUtils {
     static final String from = "flighter.group1@gmail.com";
     static final String password = "qxyqkfbpbbaibbyg";
    
    public static boolean sendEmail(String to, String subject, String content) {
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com"); 
	props.put("mail.smtp.port", "587"); 
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");

	Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password); 
            }
        };
	Session session = Session.getInstance(props, auth);
	MimeMessage msg = new MimeMessage(session);
	try {
	msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	msg.setFrom(from);
	msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
	msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setContent(content, "text/HTML; charset=UTF-8");
        Transport.send(msg);
	System.out.println("Email sent successfully");
            return true;
	} catch (Exception e) {
            System.out.println("Email sent error");
            e.printStackTrace();
            return false;
	}
    }

    
}
