<%@ Page Title="" Language="C#" MasterPageFile="~/blog.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="blog._default" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <style>

     img.articleavtor {
     
      width:100px; height:100px; float:left; margin:10px;
     }

  .tags {
         display:inline;
       
 }
     .tag {
       border-radius:0px;
     }

     .comment { 
    float:right; font-size:12px;
}

     .blog-item {
      border-bottom:solid 1px #ccc; 
      padding-bottom:10px;
     }


     .blog-item a {
        color: #d84d2d;
     text-decoration: none;
     }

       .blog-item a:hover { 
     text-decoration:underline;
     }


     .blog-item .metadata a {
      color:#ffffff;
     }

     

     .prop {
      margin:10px 10px 10px 0px;
      font-size:12px; font-family:'Century Gothic';

     }

     .metadata {
    border-bottom:solid 1px #eee; 
     border-top:solid 1px #eee;
     padding-top:10px;
     padding-bottom:10px;
     }
 </style>
    

                <div id="lstBlog">
                  
                    <asp:Repeater runat="server" ID="rpt_lists" EnableViewState="false" >
                       
                        <ItemTemplate>



                      <div class="blog-item"  >
                        <div class="panel-body">
                            <div  >
                             

                                <h4>
                                    <a   href='detail.aspx?id=<%#Eval("id") %>'><%#Eval("title") %></a>
                                </h4>
                            </div>
                            <div style="margin-bottom:6px;">
                       
                                <div class="prop">
                                  &nbsp;&nbsp;  <%# DateTime.Parse(Eval("adddate").ToString()).ToString("yyyy/MM/dd HH:mm") %>    
                                </div>

                                 


                                <!-- tags -->
            
  <div class="metadata">                    
 
    <%#GetTag(Eval("tags").ToString()) %>    &nbsp; 

   <span class="comment  ">  阅读(<%#Eval("click") %>)  评论(<%#Eval("comment") %>) </span>

    </div>


                                    <!-- /tag -->








                            </div>
                            <div> 
                                

                                <%#GetAvtor(Eval("avtor"))%>


                                
                                <%#Eval("intro") %> </div>
                        </div>
                    </div>




                        </ItemTemplate>


                    </asp:Repeater>

           
                  










                    
        <div id="thepg">
               <asp:Label runat="server" ID="lbl_pg" ></asp:Label>
         </div>

                    <div style="clear:both"></div>

                </div>

              



</asp:Content>
