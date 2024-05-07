<%@ Page Title="ddd" Language="C#"   MasterPageFile="~/blog.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="blog.detail" %>
<%@ OutputCache Duration="30" VaryByParam="id" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hf_title" ClientIDMode="Static" />
    
    <link href="tinymce/js/tinymce/plugins/codesample/prism.css" rel="stylesheet" />
    <script src="tinymce/js/tinymce/plugins/codesample/prism.js"></script>
    

    
 <style>
        .tags {
         display:inline;
       
 }
     .tag {
       border-radius:0px;
     }

     .comment { 
    float:right; font-size:12px;
}

 

     .blog-item a {
        color: #d84d2d;
     text-decoration: none;
     }

       .blog-item a:hover { 
     text-decoration:underline;
     }


     .blog-item .tags a {
      color:#ffffff;
     }

     

     .prop {
      margin:10px 10px 10px 0px;
     }

     #viewBlog img {
      max-width:740px;
     }

 </style>
    

                <div id="viewBlog">
                  
                    <asp:FormView runat="server" ID="fv_detail" EnableViewState="false" >
                       
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
                                  &nbsp;&nbsp;  <%# DateTime.Parse(Eval("adddate").ToString()).ToString("yyyy/MM/dd") %>,   <%#Eval("catname") %>
                           </div>

                                 


                                <!-- tags -->
            
                              <div class="metadata">                    
                            <div class="tags">
                                <%#GetTag(Eval("tags").ToString()) %>     &nbsp;
                            </div>
                              
                                    <span class="comment  ">
                                        <%#Eval("comment") %> 评论 / 

                                          <%#Eval("click") %> 查看

                                    </span>
                                    </div>


                                    <!-- /tag -->








                            </div>
                            <div> <%#Eval("contents") %> </div>
                        </div>
                    </div>




                        </ItemTemplate>


                    </asp:FormView>

           
                  










                    </div>







    <script src="js/htmlEncode.js"></script>
    <!-- comments -->
    <input type="hidden" id="hf_id" name="hf_id" value="<%=id %>" />

    <div class="comment-panel">
                    <h5>评论列表</h5>
                    <div id="lstComments">
                       
                        
                        <!-- item -->
                        
                        <div id="commLists">

                        </div>
                        

                         <p style="margin:0 auto; width:100%; text-align:center">
      <input id="btn_pic"  class="btn"  type="button" value="更多评论"  onclick="GetMoreComment()" />   
</p>



                        

                        <script>
                            var pageIndex=1;
                            var commLists= $('#commLists');  

                            function GetComm()
                            {  

                                $.getJSON(
                                    "comment.aspx",   
                                    { pageindex: pageIndex,t:"getcomm", random: <%=DateTime.Now.Hour %>, id:$("#hf_id").val() },
                      function (data) {  
                       
                          if(data=="")
                          {
                              $("#btn_pic").hide();
                              return;
                          }

                           
                          $.each(data, function (i, dr) {
                             
                              
                              let template=`
                                  <div class="comment-item">
                                    <div class="comment-header">
                                      <a><span class="badge">#${dr["RowNum"]}楼</span></a> 
                                           <a class="btn btn-xs"><img src="css/date.png">${dr["adddate"]}</a>
                                           <a href="#">(${ dr["nickname"] })</a>
                                   </div> 
                          
                                    <div style="padding-left: 20px; padding-bottom:20px;">
                                    <p>        
                                     ${ dr["contents"]}
                                    </p>
                                    </div>
                              </div>`;
                              
                                    commLists.append(template);

                              });
                            });
                         }
                          


                        GetComm();

                          

                            
                            function GetMoreComment() {
                                pageIndex=pageIndex+1;  
                                GetComm();
                            }


                        </script>






                          <!-- item -->





                    </div>
                    <hr />
                    <!--comment-->


























                  <div style="clear:both;"></div>


                   <!-- add comments -->
         
                    <div id="addCommant" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-offset-0 col-sm-11">发表评论</label> 
                            <div class="col-sm-offset-0 col-sm-11">
                                  <input type="text" placeholder="昵称" id="nickname" class="form-control">
                             </div>
                         </div> 
                        
                        <div class="form-group">
                             <div id="txtEditor" class="col-sm-offset-0 col-sm-11">
                                 <textarea rows="5" id="comment" style="width: 100%;"></textarea> 
                             </div> 
                            

                        </div>
                        
                         <button type="button" onclick="addComment()" class=" col-sm-offset-0 btn btn-default">提交</button>

                    </div>
        
                     <script>
                    

                        

            function addComment()
            {
                 
                var _nickname=encodeURIComponent ($("#nickname").val());
                var _comment =encodeURIComponent($("#comment").val());
                 
                $.post("comment.aspx",
                    { nickname: _nickname, comment: _comment ,id:<%=id%> },
                    function (result) {
                        alert("添加成功，审核后显示");
                        $("#nickname").val('');
                        $("#comment").val('');
                       
                    }); 
            }

        </script>

                 
         <!-- add comments end -->
        
        
        
        
        
        
        
         </div>


    <!-- /comments -->






    <script>
        $.get("click.aspx?id=<%=id%>");
    </script>


    <script>

        document.title=$("#hf_title").val()+"-"+document.title;
    </script>

</asp:Content>
