<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Consulta_Admin.aspx.cs" Inherits="Presentacion_Consulta_Admin" Title="Consulta Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width: 100%">
        <tr>
            <td colspan="3">
                <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
                    font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 100%;
                    color: navy; padding-top: 10px; font-family: Arial">
                    <tr>
                        <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                            border-bottom: navy 1px solid; text-align: left">
                            <span style="font-size: 14pt; color: navy;">ADMINISTRADOR - Consulta Solicitud </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center; width: 4%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="text-align: center; width: 90%">
                <asp:GridView ID="Grid_List_Depen" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id_Dependencia"
                    style="font-family: Arial, Helvetica, sans-serif">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Dependencia" />
                        <asp:BoundField DataField="Derechos" HeaderText="Derechos de Petición" />
                        <asp:BoundField DataField="Solicitudes" HeaderText="Solicitudes" />
                        <asp:BoundField DataField="Quejas" HeaderText="Quejas y/o Reclamos" />
                        <asp:BoundField DataField="Total" HeaderText="Total" />
                        <asp:CommandField HeaderText="Opción" NewText="Id_dependencia" 
                            SelectText="Observar" ShowSelectButton="True" UpdateText="Observado" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
            <td style="width: 4%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="text-align: center; width: 90%">
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    SelectMethod="SelectSolicitudes_Depend" TypeName="Solicitud">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Grid_List_Depen" DefaultValue="0" 
                            Name="Id_Dependencia" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

            </td>
            <td style="width: 4%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5%">
                </td>
            <td style="text-align: center; width: 90%">
                <asp:GridView ID="Solicitud" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;" 
                    AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Id_Solicitud" HeaderText="Solicitud" />
                        <asp:BoundField DataField="Tipo1" HeaderText="Tipo" />
                        <asp:BoundField DataField="Fecha1" HeaderText="Fecha Registro" />
                        <asp:BoundField DataField="Fecha3" HeaderText="Fecha Limite" />
                        <asp:BoundField DataField="Nombre" HeaderText="Estado" />
                        <asp:HyperLinkField HeaderText="Mostrar" 
                            Text="Click" DataNavigateUrlFields="Id_Solicitud" 
                            DataNavigateUrlFormatString="~/Presentacion/Solic_Defin.aspx?solicitud={0}" 
                            NavigateUrl="~/Presentacion/Solic_Defin.aspx" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>

            </td>
            <td style="width: 4%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="text-align: center; width: 90%">
                &nbsp;</td>
            <td style="width: 4%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; " colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

