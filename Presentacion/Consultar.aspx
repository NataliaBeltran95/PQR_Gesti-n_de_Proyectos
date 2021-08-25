<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true"
    CodeFile="~/LogicaPresentacion/Consultar.aspx.cs" Inherits="Presentacion_Consultar"
    Title="Consultar Solicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%">
        <tr>
            <td colspan="3">
                <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
                    font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 100%;
                    color: navy; padding-top: 10px; font-family: Arial">
                    <tr>
                        <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                            border-bottom: navy 1px solid; text-align: left">
                            <span style="font-size: 14pt; color: navy;">OPERARIO - Consulta Solicitud </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Tb_Sol"
                    ErrorMessage="Debe ingresar números unicamente" Style="font-weight: 700; font-family: Arial;
                    font-size: 10pt; text-align: right;" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: bold; font-size: 12pt; color: navy; font-family: Arial;" colspan="3">
                No. Solicitud:&nbsp;&nbsp;
                <asp:TextBox ID="Tb_Sol" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Button ID="Ing" runat="server" OnClick="Ingresar_Click" Text="Ingresar" Width="114px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="10pt"
                    ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">
                </td>
            <td style="text-align: center; width: 75%">
                <asp:GridView ID="Solicitud" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;" 
                    AutoGenerateColumns="False">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Tipo1" HeaderText="Tipo" />
                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha Registro" />
                        <asp:BoundField DataField="Fecha3" HeaderText="Fecha Vencimiento" />
                        <asp:BoundField DataField="Mensaje" HeaderText="Mensaje" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
            <td style="width: 5%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: bold; font-size: 14pt; color: navy; font-family: Arial;" colspan="3">
                ESTADO DE LA SOLCITUD</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; width: 20%;">
                &nbsp;</td>
            <td style="text-align: center; width: 75%;">
                <asp:GridView ID="Seguim" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" style="font-family: Arial, Helvetica, sans-serif" 
                    AutoGenerateColumns="False">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Dep" HeaderText="Dependencia" />
                        <asp:BoundField DataField="Fecha1" HeaderText="Fecha Registro" />
                        <asp:BoundField DataField="Observacion" HeaderText="Mensaje" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:HyperLinkField 
                            HeaderText="Imagen Adjunta" DataNavigateUrlFields="Imagen" Text="Ver" />
                        <asp:HyperLinkField DataNavigateUrlFields="Archivo" HeaderText="Archivo" 
                            Text="Ver" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                </td>
            <td style="text-align: center; width:5%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; " colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
