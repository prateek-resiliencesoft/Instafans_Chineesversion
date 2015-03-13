﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="SocialPanel.User.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {

            var data = "";
            $.ajax({
                type: "POST",
                url: "../JquerPost.aspx/GetOrdersForUser",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    data = eval(result);
                    //alert(data);
                    data = JSON.stringify(data);
                    //alert(data);
                    var theme = "";
                    //aert(data);

                    //data = '[{"Id":26,"URL":"http://facebook.com/Test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383997127063)\/","OrderStatus":"Processing","OrderId":"126679788171f9b21a","StartPoint":1,"EndPoint":101,"OrderType":"PageLike","UpdateDate":"\/Date(1383997127083)\/","EmployeeName":"test"},{"Id":27,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989876760)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":101,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":28,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989878017)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":200,"EndPoint":300,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":29,"URL":"https://facebook.com/test","Amount":101,"UserName":"test","OrderDate":"\/Date(1383989879093)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":102,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":30,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989880153)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":201,"EndPoint":301,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":31,"URL":"https://facebook.com/test","Amount":1000,"UserName":"test","OrderDate":"\/Date(1383989881213)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":250,"EndPoint":1250,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":32,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989882310)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":214,"EndPoint":314,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":33,"URL":"https://facebook.com/test","Amount":10,"UserName":"test","OrderDate":"\/Date(1383989883363)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":11,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":34,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989884433)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":100,"EndPoint":200,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":35,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989885480)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":14,"EndPoint":114,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":36,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"\/Date(1383989886573)\/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":52,"EndPoint":152,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null}]';//'{"d":[{"Id":26,"URL":"http://facebook.com/Test","Amount":100,"UserName":"test","OrderDate":"Date(1383997127063)","OrderStatus":"Processing","OrderId":"126679788171f9b21a","StartPoint":1,"EndPoint":101,"OrderType":"PageLike","UpdateDate":"/Date(1383997127083)/","EmployeeName":"test"},{"Id":27,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989876760)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":101,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":28,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989878017)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":200,"EndPoint":300,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":29,"URL":"https://facebook.com/test","Amount":101,"UserName":"test","OrderDate":"/Date(1383989879093)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":102,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":30,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989880153)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":201,"EndPoint":301,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":31,"URL":"https://facebook.com/test","Amount":1000,"UserName":"test","OrderDate":"/Date(1383989881213)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":250,"EndPoint":1250,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":32,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989882310)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":214,"EndPoint":314,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":33,"URL":"https://facebook.com/test","Amount":10,"UserName":"test","OrderDate":"/Date(1383989883363)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":11,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":34,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989884433)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":100,"EndPoint":200,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":35,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989885480)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":14,"EndPoint":114,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":36,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989886573)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":52,"EndPoint":152,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null}]}';
                    //alert(data);
                    // prepare the data
                    var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'OrderId', type: 'int' },
                    { name: 'OrderType', type: 'string' },
                    { name: 'Url', type: 'string' },
                    { name: 'Amount', type: 'int' },
                    { name: 'OrderDate', type: 'date' },
                    { name: 'CurrentCount', type: 'int' },
                    { name: 'StartPoint', type: 'int' },
                    { name: 'EndPoint', type: 'int' },
                    { name: 'OrderStatus', type: 'string' },
                    { name: 'LastUpdateDate', type: 'date' },
                    { name: 'Paid', type: 'decimal' }
                ],
                localdata: data,
                pagesize: 20,
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                },

                deleterow: function (rowid, commit) {
                    // synchronize with the server - send delete command
                    // call commit with parameter true if the synchronization with the server is successful
                    //and with parameter false if the synchronization failed.

                    var TempData = "";
                    $.post("JquerPost.aspx/DeletePinterestDetailForAdmin", { id: dataRecord.Id })
                        .done(function (TempData) {
                            alert("Data Loaded: " + TempData);
                            commit(true);
                        });


                },
                updaterow: function (rowid, rowdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    commit(true);
                }
            };
                    //alert("1");
            var statusRender = function (row, columnfield, value) {

                        if (value == 'Completed') {
                            return '<span class="label label-success">Completed</span>';
                        }
                        else if (value == 'Processing') {
                            return '<span class="label label-warning">Processing</span>';
                        }
                        else if (value == 'Pending') {
                            return '<span class="label label-info">Pending</span>';
                        }
                        else if (value == 'Private') {
                            return '<span class="label label-important">Private</span>';
                        }
                        else {
                            return '<span class="label label-important">' + value + '</span>';
                        }
                    }

                    var cellsrenderer = function (row, column, value, defaultHtml) {
                        if (row == 0 || row == 2 || row == 5) {
                            var element = $(defaultHtml);
                            element.css({ 'background-color': 'Yellow', 'width': '100%', 'height': '100%', 'margin': '0px' });
                            return element[0].outerHTML;
                        }
                        return defaultHtml;
                    }
                    var editOrder = function (row, column, value, defaultHtml) {
                        var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                        return '<a href="/Admin/EditOrderDetailsForPinterest.aspx?id=' + dataRecord.Id + '" target="_blank"/>Edit</a>'
                    }

                    var hrefUrl = function (row, column, value, defaultHtml) {
                        var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                        return '<a href=' + value + ' target="_blank"/>' + value + '</a>'
                    }

                    var dataAdapter = new $.jqx.dataAdapter(source);
                    //alert(dataAdapter);
                    $("#jqxgrid").jqxGrid(
            {
                width: 1040,
                source: dataAdapter,
                theme: theme,
                selectionmode: 'multiplerowsextended',
                sortable: true,
                showstatusbar: true,
                statusbarheight: 50,
                showaggregates: true,
                pageable: true,
                autoheight: true,
                columnsresize: true,
                filterable: true,
                enabletooltips: false,
                showfilterrow: true,
                columns: [
//                    { text: 'Edit', datafield: 'Edit', width: 50, cellsrenderer: editOrder },
                    { text: '订单编号', datafield: 'OrderId', width: 70 },
                    { text: '订单类型', datafield: 'OrderType', width:70 },
                    { text: '用户名/链接', datafield: 'Url',cellsrenderer: hrefUrl, width: 270 },
                    { text: '订单数量', datafield: 'Amount', width: 100, aggregates: ['sum'] },
                    { text: '下单日期', datafield: 'OrderDate', width: 170, cellsformat: 'M/d/yyyy h:mm:ss tt' },
                    { text: '已添加数', datafield: 'CurrentCount', width: 70 },
                    { text: '起始数量', datafield: 'StartPoint', width: 70 },
                    { text: '完成数量', datafield: 'EndPoint', width: 70 },
                    { text: '订单状态', datafield: 'OrderStatus', width: 80, cellsrenderer: statusRender },
                    //{ text: 'Last Update', datafield: 'LastUpdateDate', width: 80, cellsformat: 'M/d/yyyy h:mm:ss tt' },
                    { text: '消费金额', datafield: 'Paid', width: 70 }
                ]
            });

                    $("#deleterowbutton").jqxButton({ theme: theme });

                    // delete row.
                    $("#deleterowbutton").on('click', function () {
                        var selectedrowindex = $("#jqxgrid").jqxGrid('getselectedrowindex');
                        var rowscount = $("#jqxgrid").jqxGrid('getdatainformation').rowscount;
                        if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
                            var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                            //alert(id);
                            var commit = $("#jqxgrid").jqxGrid('deleterow', id);
                        }
                    });

                    $("#jqxgrid").on('cellendedit', function (event) {
                        var args = event.args;
                        var strmessage = "Event Type: cellendedit, Column: " + args.datafield + ", Row: " + (1 + args.rowindex) + ", Value: " + args.value;
                        //alert(strmessage);
                        //$("#cellendeditevent").text("Event Type: cellendedit, Column: " + args.datafield + ", Row: " + (1 + args.rowindex) + ", Value: " + args.value);
                    });



                    //            $('#events').jqxPanel({ width: 300, height: 300, theme: theme });

                    //            $("#jqxgrid").on("pagechanged", function (event) {
                    //                $("#eventslog").css('display', 'block');
                    //                if ($("#events").find('.logged').length >= 5) {
                    //                    $("#events").jqxPanel('clearcontent');
                    //                }

                    //                var args = event.args;
                    //                var eventData = "pagechanged <div>Page:" + args.pagenum + ", Page Size: " + args.pagesize + "</div>";
                    //                $('#events').jqxPanel('prepend', '<div class="logged" style="margin-top: 5px;">' + eventData + '</div>');

                    //                // get page information.
                    //                var paginginformation = $("#jqxgrid").jqxGrid('getpaginginformation');
                    //                $('#paginginfo').html("<div style='margin-top: 5px;'>Page:" + paginginformation.pagenum + ", Page Size: " + paginginformation.pagesize + ", Pages Count: " + paginginformation.pagescount + "</div>");
                    //            });

                    //            $("#jqxgrid").on("pagesizechanged", function (event) {
                    //                $("#eventslog").css('display', 'block');
                    //                $("#events").jqxPanel('clearcontent');

                    //                var args = event.args;
                    //                var eventData = "pagesizechanged <div>Page:" + args.pagenum + ", Page Size: " + args.pagesize + ", Old Page Size: " + args.oldpagesize + "</div>";
                    //                $('#events').jqxPanel('prepend', '<div style="margin-top: 5px;">' + eventData + '</div>');

                    //                // get page information.          
                    //                var paginginformation = $("#jqxgrid").jqxGrid('getpaginginformation');
                    //                $('#paginginfo').html("<div style='margin-top: 5px;'>Page:" + paginginformation.pagenum + ", Page Size: " + paginginformation.pagesize + ", Pages Count: " + paginginformation.pagescount + "</div>");
                    //            });

                }
            })
        });
    </script>
    <style>
        .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected)
        {
            color: black;
            background-color: #b6ff00;
        }
        .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected)
        {
            color: black;
            background-color: yellow;
        }
        .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected)
        {
            color: black;
            background-color: #e83636;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">首页</a> <span class="divider">/</span> </li>
                <li><a href="#">华人订单记录</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>华人订单记录</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                        
                    </div>
                </div>
                <div class="box-content">
                  <div id='jqxWidget' style="margin-left: 20px;">
        <div id="jqxgrid">
        </div>
        <div id="cellbegineditevent">
        </div>
        <div style="margin-top: 10px;">
           <%-- <input id="deleterowbutton" type="button" value="Delete Selected Row" />--%>
        </div>
    </div>
                </div>
                <!--/span-->
            </div>
            <!--/row-->
            <!-- content ends -->
        </div>
    </div>
</asp:Content>
