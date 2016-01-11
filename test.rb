require 'mandrill'
m = Mandrill::API.new 
      message = { 
       :subject=> "HELLO THERE!",  
       :from_name=> "ade",  
       :text=>"hi do u like the rum?",  
       :to=>[
        {
          :email=> "miattajeh@ymail.com", 
          :name=> "ade Akin"
          }
          ],  
         :html=>"<html><h1><strong>i love it</strong></h1><h3> how are you? </h3><strong>Did you see my cookies?</strong></h1></html>",  
         :from_email=>"adeshyne72@gmail.com" 
       } 

       sending = m.messages.send message 
       puts sending
       