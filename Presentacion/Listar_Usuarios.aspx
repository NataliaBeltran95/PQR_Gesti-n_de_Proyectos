<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Listar_Usuarios.aspx.cs" Inherits="Presentacion_Listar_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 174px">&nbsp;</td>
            <td style="width: 538px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 174px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td style="width: 538px">
                <asp:GridView ID="GV_usuarios" runat="server" Align="center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Usuario" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="cedula" HeaderText="Cedula" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellidos" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="fecha_naciemiento" HeaderText="Fecha Naciemiento" />
                        <asp:BoundField DataField="edad" HeaderText="Edad" />
                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        <br />
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

