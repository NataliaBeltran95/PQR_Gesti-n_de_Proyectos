<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Sol_Depa.aspx.cs" Inherits="Presentacion_Sol_Depa" Title="Lista Solictudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
        <tr>
            <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                border-bottom: navy 1px solid; text-align: left">
                <span style="font-size: 14pt; color: navy;">DEPENDENCIA - Solicitudes </span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                    DataSourceID="solicitudes" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="solicitudes" runat="server"></asp:ObjectDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

