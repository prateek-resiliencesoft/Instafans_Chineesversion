﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestGrid.aspx.cs" Inherits="Social_Media_Service_Panel.TestGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="Styles/Jqx/jqx.base.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Jqx/jqx.black.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/Jqx/gettheme.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/Jqx/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxcore.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxbuttons.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxscrollbar.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxmenu.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.columnsresize.js"></script> 
    <script type="text/javascript" src="Scripts/Jqx/jqxdata.js"></script> 
    <script type="text/javascript" src="Scripts/Jqx/gettheme.js"></script>

    <script type="text/javascript" src="Scripts/Jqx/jqxdata.js"></script> 
    <script type="text/javascript" src="Scripts/Jqx/jqxlistbox.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.pager.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="Scripts/Jqx/jqxpanel.js"></script>

    <script type="text/javascript" src="Scripts/Jqx/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxcheckbox.js"></script>
    <script type="text/javascript" src="Scripts/Jqx/jqxwindow.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var data = "";
            $.ajax({
                type: "POST",
                url: "JquerPost.aspx/GetFacebookOrdersForAdmin",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    data = eval(result);
                    //alert(data);
                    data = JSON.stringify(data);
                    //alert(data);


                    var theme = "";
                    //alert(data);

                    //data = tempdata; //'{"d":[{"Id":26,"URL":"http://facebook.com/Test","Amount":100,"UserName":"test","OrderDate":"Date(1383997127063)","OrderStatus":"Processing","OrderId":"126679788171f9b21a","StartPoint":1,"EndPoint":101,"OrderType":"PageLike","UpdateDate":"/Date(1383997127083)/","EmployeeName":"test"},{"Id":27,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989876760)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":101,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":28,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989878017)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":200,"EndPoint":300,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":29,"URL":"https://facebook.com/test","Amount":101,"UserName":"test","OrderDate":"/Date(1383989879093)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":102,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":30,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989880153)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":201,"EndPoint":301,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":31,"URL":"https://facebook.com/test","Amount":1000,"UserName":"test","OrderDate":"/Date(1383989881213)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":250,"EndPoint":1250,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":32,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989882310)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":214,"EndPoint":314,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":33,"URL":"https://facebook.com/test","Amount":10,"UserName":"test","OrderDate":"/Date(1383989883363)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":1,"EndPoint":11,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":34,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989884433)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":100,"EndPoint":200,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":35,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989885480)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":14,"EndPoint":114,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null},{"Id":36,"URL":"https://facebook.com/test","Amount":100,"UserName":"test","OrderDate":"/Date(1383989886573)/","OrderStatus":"Pending","OrderId":"1086060656bdf3efdb","StartPoint":52,"EndPoint":152,"OrderType":"Comment Like","UpdateDate":null,"EmployeeName":null}]}';
                    //alert(data);
                    // prepare the data
                    var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'Id', type: 'string' },
                    { name: 'URL', type: 'string' },
                    { name: 'Amount', type: 'string' },
                    { name: 'UserName', type: 'string' },
                    { name: 'OrderDate', type: 'string' },
                    { name: 'OrderStatus', type: 'string' },
                    { name: 'OrderId', type: 'string' },
                    { name: 'StartPoint', type: 'string' },
                    { name: 'EndPoint', type: 'string' },
                    { name: 'OrderType', type: 'string' },
                    { name: 'UpdateDate', type: 'string' },
                    { name: 'EmployeeName', type: 'string' }
                ],
                localdata: data,
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                },

                deleterow: function (rowid, commit) {
                    // synchronize with the server - send delete command
                    // call commit with parameter true if the synchronization with the server is successful 
                    //and with parameter false if the synchronization failed.
                    
                     var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowid);
                     alert(dataRecord.Id);

                     var tempData = "";

                     $.ajax({
                         url: 'JquerPost.aspx/DeleteFacebookDetailForAdmin',
                         type: 'POST',
                         success: function (tempData) {
                             alert(tempData);
                         }
                     });

                    //$.post("JquerPost.aspx/DeleteFacebookDetailForAdmin")
                    //    .done(function (data) {
                    //        alert(data);
                    //        commit(true);
                    //    });

                },

                updaterow: function (rowid, rowdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    alert(rowdata["Id"]);
                    commit(true);

                }
            };
                    //alert("1");
                    var cellclass = function (row, columnfield, value) {

                        if (value == 'Completed') {
                            return 'green';
                        }
                        else if (value == 'Processing') {
                            return 'yellow';
                        }
                        else if (value == 'Pending') {
                            return 'red';
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

                    var dataAdapter = new $.jqx.dataAdapter(source);

                    var createGridEditor = function (row, cellValue, editor, cellText, width, height) {
                        // construct the editor.
                        alert(cellValue);
                        //                if (row == 0) {
                        //                    editor.jqxNumberInput({ decimalDigits: 0, inputMode: 'simple', theme: theme, width: width, height: height, spinButtons: true });
                        //                }
                        //                else 
                        if (row == 5) {
                            editor.jqxDropDownList({ autoDropDownHeight: true, theme: theme, width: width, height: height, source: ['United States', 'Germany', 'United Kingdom'] });
                        }
                        //                else if (row == 2) {
                        //                    var element = $('<div tabIndex=0 style="position: absolute; top: 50%; left: 50%; margin-top: -7px; margin-left: -10px;"></div>');
                        //                    editor.append(element);
                        //                    element.jqxCheckBox({ animationShowDelay: 0, animationHideDelay: 0, width: 16, height: 16, theme: theme });
                        //                }
                    }

                    //alert(dataAdapter);
                    $("#jqxgrid").jqxGrid(
            {
                width: 1300,
                source: dataAdapter,
                theme: theme,
                selectionmode: 'multiplerowsextended',
                sortable: true,
                
                pageable: true,
                autoheight: true,
                columnsresize: true,
                filterable: true,
                enabletooltips: false,
                //                renderstatusbar: function (statusbar) {
                //                    // appends buttons to the status bar.
                //                    var container = $("<div style='overflow: hidden; position: relative; margin: 5px;'></div>");
                //                    var addButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='Styles/Jqx/images/add.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Add</span></div>");
                //                    var deleteButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='Styles/Jqx/images/close.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Delete</span></div>");
                //                    var reloadButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='Styles/Jqx/images/refresh.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Reload</span></div>");
                //                    var searchButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='Styles/Jqx/images/search.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Find</span></div>");
                //                    container.append(addButton);
                //                    container.append(deleteButton);
                //                    container.append(reloadButton);
                //                    container.append(searchButton);
                //                    statusbar.append(container);
                //                    addButton.jqxButton({ theme: theme, width: 60, height: 20 });
                //                    deleteButton.jqxButton({ theme: theme, width: 65, height: 20 });
                //                    reloadButton.jqxButton({ theme: theme, width: 65, height: 20 });
                //                    searchButton.jqxButton({ theme: theme, width: 50, height: 20 });
                //                    // add new row.
                //                    addButton.click(function (event) {
                //                        var datarow = generatedata(1);
                //                        $("#jqxgrid").jqxGrid('addrow', null, datarow[0]);
                //                    });
                //                    // delete selected row.
                //                    deleteButton.click(function (event) {
                //                        var selectedrowindex = $("#jqxgrid").jqxGrid('getselectedrowindex');
                //                        var rowscount = $("#jqxgrid").jqxGrid('getdatainformation').rowscount;
                //                        var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                //                        $("#jqxgrid").jqxGrid('deleterow', id);
                //                    });
                //                    // reload grid data.
                //                    reloadButton.click(function (event) {
                //                        $("#jqxgrid").jqxGrid({ source: getAdapter() });
                //                    });
                //                    // search for a record.
                //                    searchButton.click(function (event) {
                //                        var offset = $("#jqxgrid").offset();
                //                        $("#jqxwindow").jqxWindow('open');
                //                        $("#jqxwindow").jqxWindow('move', offset.left + 30, offset.top + 30);
                //                    });
                //                },
                columns: [
                  { text: 'Delete', datafield: 'Delete', columntype: 'button', width: 80, buttonclick: 'deleterow', cellsrenderer: function () {
                      return "Delete";
                  }, 
                  },
                    { text: 'Id', datafield: 'Id', width: 55 },
                    { text: 'Url', datafield: 'URL', width: 230 },
                    { text: 'Amount', datafield: 'Amount', width: 60 },
                    { text: 'UserName', datafield: 'UserName', width: 100 },
                    { text: 'OrderDate', datafield: 'OrderDate', width: 140 },
                    { text: 'OrderStatus', datafield: 'OrderStatus', width: 100, cellclassname: cellclass, columntype: 'dropdownlist',
                        createeditor: function (row, cellvalue, editor, height) {
                            editor.jqxDropDownList({ source: ["Processing", "Pending", "Completed"] });

                        }
                    },
                    { text: 'OrderId', datafield: 'OrderId', width: 120 },
                    { text: 'StartPoint', datafield: 'StartPoint', width: 80 },
                    { text: 'EndPoint', datafield: 'EndPoint', width: 80 },
                    { text: 'OrderType', datafield: 'OrderType', width: 80 },
                    { text: 'UpdateDate', datafield: 'UpdateDate', width: 140 },
                    { text: 'Employee', datafield: 'EmployeeName', width: 120 }

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
        .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: #b6ff00;
        }
        .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: yellow;
        }
        .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: #e83636;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id='jqxWidget' style="margin-left:20px;">
        <div id="jqxgrid"></div>
        <div id="cellbegineditevent"></div>
        <div style="margin-top: 10px;">
                <input id="deleterowbutton" type="button" value="Delete Selected Row" />
            </div>
    </div>
</asp:Content>
