<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true"
    CodeFile="~/LogicaPresentacion/Modificar_Actividad.aspx.cs" Inherits="Presentacion_Modificar_Actividad"
    Title="Página sin título" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
        <tr>
            <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                border-bottom: navy 1px solid; text-align: left">
                <span style="font-size: 14pt; color: navy;">FUNCIONARIO - Seguimiento Solicitud
                </span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-size: xx-small;">
                    <br />
                    <tr>
                        <td style="width: 100%">
                            <table style="font-weight: bold; font-size: 10pt; width: 100%; color: navy; font-family: Arial">
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Fecha Solictud:
                                    </td>
                                    <td style="height: 26px; text-align: left">
                                        <asp:TextBox ID="TB_Fecha_Inicio" runat="server" Font-Names="Arial" Width="30%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Apellidos:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <span style="font-size: 14pt; color: #ff0000">
                                            <asp:TextBox ID="TB_Apellidos" runat="server" Font-Names="Arial" Width="30%" ReadOnly="True"></asp:TextBox>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left; height: 28px;">
                                        Nombres:
                                    </td>
                                    <td style="width: 30%; text-align: left; height: 28px;">
                                        <asp:TextBox ID="TB_Nombres" runat="server" Font-Names="Arial" Width="30%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Mensaje:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Mensaje" runat="server" Rows="5" TextMode="MultiLine" Width="97%"
                                            Height="96px" Font-Names="Arial" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        &nbsp;
                                    </td>
                                </tr>
                                </table>
                        </td>
                    </tr> 
            </td>
        </tr>
        <tr>
            <td>
               <table width="100%">
                    <tr>
                                <td colspan="2" style="height: 27px; text-align: center; background-color: #e8e8f8;">
                                    <span style="font-family: Arial; color: navy;"><strong>IMAGENES</strong></span>
                                </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: super; height: 35px; text-align: left; width: 12%">
                            &nbsp;</td>
                        <td style="vertical-align: super; height: 35px; text-align: left;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="vertical-align: super; text-align: center">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                                Width="90%" PageSize="1">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table cellspacing="0" cellpadding="10">
                                                <tr>
                                                    <td>
                                                        <table border="1" style="border-color: #999999; border-style: solid; background-color: #f5f5f5;"
                                                            cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td style="text-align: center; font-size: 10pt; padding: 20px 30px 2px 30px; border-style: none;">
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("[ruta]") %>' Width="300" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; font-size: 10pt; padding: 0px 0px 5px 0px; border-style: none;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label1" runat="server">[No hay imagenes asociadas]</asp:Label>
                                </EmptyDataTemplate>
                                <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" HorizontalAlign="Center" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 27px; text-align: center; background-color: #e8e8f8;">
                            <span style="font-family: Arial; color: navy;"><strong>ARCHIVOS ADJUNTOS</strong></span>
                        </td>
                    </tr>
                    <tr>
                                    <td colspan="2" style="width: 31%; height: 32px; text-align: center">
                                        &nbsp;</td>
                                </tr>
                    <tr>
                                    <td colspan="2" style="vertical-align: top; height: 35px; text-align: center">
                                        <span style="font-size: 9pt; font-family: Arial"></span>
                                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                            AllowPaging="True" AutoGenerateColumns="False" Width="90%" Font-Names="Arial"
                                            Font-Size="9pt" Style="vertical-align: top" PageSize="4">
                                            <Columns>
                                                <asp:HyperLinkField DataNavigateUrlFields="ruta" DataNavigateUrlFormatString="{0}"
                                                    DataTextField="nombre" HeaderText="Nombre adjunto" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Label ID="Label1" runat="server">[No hay plantillas asociadas]</asp:Label>
                                            </EmptyDataTemplate>
                                            <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <EditRowStyle BackColor="#999999" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        </asp:GridView>
                                        &nbsp;
                                    </td>
                                </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
    <tr>
                                    <td style="text-align: center; ">
                                        <asp:Button ID="B_Sol_Red" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                            ForeColor="Navy" Text="Responder Solicitud" ValidationGroup="Val_1" Width="245px"
                                            OnClick="B_Solicitud"/>
                                    </td>
                                </tr>
                                <tr>
                            
                                <td>
                                    &nbsp;</td>
                                </tr>
    </table>
</asp:Content>
