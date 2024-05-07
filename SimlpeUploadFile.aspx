<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimlpeUploadFile.aspx.cs" Inherits="SimlpeUploadFile" %>
<!DOCTYPE html> 
<html>
<head runat="server">
    <title>上传</title>
   

</head>
<body  style=" font-family:Verdana; font-size:12px; text-align:center;  line-height:30px;">
    <form id="form1" runat="server">
     <br />  

     <asp:FileUpload ID="f" runat="server"    />

        <br />
        <asp:CheckBox runat="server" ID="cb_ys" Text="压缩图片" />  
        <br />
       
        
      
 <asp:Button ID="Button1" runat="server" Text="上传" class="btn btn-primary btn-sm" 
            onclick="Button1_Click" /> <br />

        
    
    
    
    </form>
</body>
</html>
