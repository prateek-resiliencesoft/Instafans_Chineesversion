<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true" CodeBehind="InstagramUsers.aspx.cs" Inherits="SocialPanel.User.InstagramUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {

        var data = "";
        $.ajax({
            type: "POST",
            url: "../JquerPost.aspx/GetAutoLikeUsersForUser",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                data = eval(result);
                data = JSON.stringify(data);
                var theme = "";
                var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'ID', type: 'int' },
                     { name: 'Login_Username', type: 'string' },
                    { name: 'Insta_Username', type: 'string' },
                    { name: 'MinCount', type: 'int' },
                    { name: 'MaxCount', type: 'int' },
                    { name: 'Status', type: 'string' },
                    { name: 'Date', type: 'date' }
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
                var statusRender = function (row, columnfield, value) {

                    if (value == 'Active') {
                        return '<span class="label label-success">Active</span>';
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
                    return '<a class="btn btn-info" href="/Admin/InstagramUser.aspx?id=' + dataRecord.ID + '" target="_blank"><i class="icon-edit icon-white"></i>Edit</a>'
                }

                var hrefUrl = function (row, column, value, defaultHtml) {
                    var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                    return '<a href="http://instagram.com/"' + value + '" target="_blank"/>' + value + '</a>'
                }

                var dataAdapter = new $.jqx.dataAdapter(source);
                //alert(dataAdapter);
                $("#jqxgrid").jqxGrid(
            {
                width: 1040,
                rowsheight: 30,
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

                columns: [
                { text: 'Edit', datafield: 'Edit', width: 62, cellsrenderer: editOrder },
                    { text: 'ID', datafield: 'ID', width: 70 },
                    { text: 'Client', datafield: 'Login_Username', width: 200 },
                    { text: 'Instagram User', datafield: 'Insta_Username', width: 200 },
                    { text: 'MinCount', datafield: 'MinCount', width: 100, aggregates: ['sum'] },
                    { text: 'MaxCount', datafield: 'MaxCount', width: 100, aggregates: ['sum'] },
                    { text: 'Status', datafield: 'Status', width: 100, cellsrenderer: statusRender },
                    { text: 'Date', datafield: 'Date', width: 200, cellsformat: 'M/d/yyyy h:mm:ss tt' }

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
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">Auto Like Users</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Auto Like Users</h2>
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
