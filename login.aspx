<%@ Page Title="" Language="C#" MasterPageFile="~/blog.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="blog.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width:300px;">
         

                   <div class="form-group" >
                        <label  >用户名</label>
                        <asp:TextBox runat="server" ID="txt_username" class="form-control"></asp:TextBox>

                       <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ID="rf1" ControlToValidate="txt_username" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label >密码</label>
                         <asp:TextBox runat="server" ID="txt_pwd" TextMode="Password" class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ID="rf2" ControlToValidate="txt_pwd" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>


         <asp:Button runat="server" ID="btn_login"  class="btn btn-default" Text="登录" OnClick="btn_login_Click" />
                         </div>

</asp:Content>
