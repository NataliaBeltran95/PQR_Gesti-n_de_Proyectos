<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Listado_Consultar.aspx.cs" Inherits="Presentacion_Listado_Consultar" Title="Solicitudes Pendientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 70%">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 70%; text-align: center;">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                    DataSourceID="Sol" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                    AutoGenerateColumns="False" style="font-family: Arial, Helvetica, sans-serif" EnableModelValidation="True">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Id_Solicitud" HeaderText="Solicitud" />
                        <asp:BoundField DataField="Tipo2" HeaderText="Tipo" />
                        <asp:TemplateField HeaderText="Mensaje">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Observacion") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Observacion") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fecha1" HeaderText="Fecha" />
                        <asp:BoundField DataField="Fecha3" HeaderText="Fecha Vencimiento" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id_Solicitud" 
                            DataNavigateUrlFormatString="~/Presentacion/Modificar_Actividad.aspx?Id_Solicitud={0}" 
                            HeaderText="Revisar" NavigateUrl="~/Presentacion/Modificar_Actividad.aspx" 
                            Text="Seleccionar" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="Sol" runat="server" SelectMethod="SelectSolicitudes" 
                    TypeName="Seguimiento">
                    <SelectParameters>
                        <asp:SessionParameter Name="IdDep" SessionField="Dep" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="width: 15%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 70%">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

