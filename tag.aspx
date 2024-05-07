<%@ Page Title="" Language="C#" MasterPageFile="~/blog.Master" AutoEventWireup="true" CodeBehind="tag.aspx.cs" Inherits="blog.tag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style>
        .pg span, .pg a {
         display:inline-block;
         margin:8px;
         padding:8px;
         width:30px;
         height:30px;
         text-align:center;
         border:solid 1px #ccc;
        
        }

        .thum {
         height:60px;
        }
    </style>

    
    <asp:GridView runat="server" ID="gv"
         GridLines="None" AutoGenerateColumns="false" 
         CssClass="table table-hover"
         AllowPaging="true"
         PageSize="20"
         DataSourceID="sds"
        
        >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>文章列表</HeaderTemplate>
                <ItemTemplate>
                    <a href="detail.aspx?id=<%#Eval("id") %>"><%#Eval("title") %></a>
                </ItemTemplate>

            </asp:TemplateField>

        </Columns>
          <PagerStyle CssClass="pg" /> 
    </asp:GridView>









    <asp:SqlDataSource runat="server" ID="sds" 
        

         ConnectionString="<%$ConnectionStrings:ConnectionString %>"
         SelectCommand=" select id,title from article where  id  in ( select aid from  tags where tagname=@tag) order by id desc  "
        
        >

        <SelectParameters>
            <asp:QueryStringParameter Name="tag"  QueryStringField="tag" ConvertEmptyStringToNull="false" />
        </SelectParameters>

    </asp:SqlDataSource>










</asp:Content>
