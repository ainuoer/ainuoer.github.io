<%@ Page Title="" Language="C#" MasterPageFile="~/blog.Master"  EnableViewState="false"  AutoEventWireup="true" CodeBehind="photo.aspx.cs" Inherits="blog.photo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    
<script src="js/Highslide/highslide.js"></script>
 <link href="js/Highslide/highslide.css" rel="stylesheet" />
 <script type="text/javascript">
        hs.graphicsDir = 'js/highslide/graphics/';
        hs.wrapperClassName = 'wide-border';
</script>



    <div id="lstPhoto">


       <asp:Repeater runat="server" ID="rpt_lists" EnableViewState="false" >
                       
                        <ItemTemplate>

                          
                           


                            <div class="thumbnail photo-penal">
                                <a href="<%#Eval("opath") %>"  class="highslide" onclick='return hs.expand(this)'>
                                    <div class="photo-item">
                                          <img src="<%#Eval("thumpath") %>" />
                                    </div> 


                                    <div class="photo-title"><span><%#Eval("title") %></span></div>

                                 </a>
                            </div>


                            </ItemTemplate>
           </asp:Repeater>


        <div style="clear:both">&nbsp;</div>

                      
        <div id="thepg">
               <asp:Label runat="server" ID="lbl_pg" ></asp:Label>
         </div>


        </div>




</asp:Content>
