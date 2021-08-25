<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Final_Solicitud.aspx.cs" Inherits="Presentacion_Final_Solicitud" Title="Contestar Solicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
        <tr>
            <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                border-bottom: navy 1px solid; text-align: left">
                <span style="font-size: 14pt; color: navy;">FUNCIONARIO - Contestar Solicitud </span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <table style="width: 100%">
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                    <tr>
                        <td style="width: 100%">
                            <table style="font-weight: bold; font-size: 10pt; width: 100%; color: navy; font-family: Arial">
                                <tr>
                                    <td style="width: 17%; text-align: left">
                                        Mensaje:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Mensaje" runat="server" Rows="5" TextMode="MultiLine" Width="97%"
                                            Height="96px" Font-Names="Arial"></asp:TextBox>
                                        <span style="font-size: 14pt; color: #ff0000">* </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Mensaje"
                                            ErrorMessage="Campo requerido" Font-Names="Arial" Font-Size="9pt" ValidationGroup="Val_1"
                                            SetFocusOnError="True" EnableTheming="True"></asp:RequiredFieldValidator></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 17%; text-align: left">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height: 27px; text-align: center; background-color: #e8e8f8;">
                                        <span style="font-family: Arial; color: navy;"><strong>ARCHIVOS ADJUNTOS</strong></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 27px; text-align: left; width: 17%;">
                                    </td>
                                    <td style="vertical-align: super; height: 27px; text-align: left; width: 661px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 35px; text-align: left; width: 17%;">
                                        <strong><span style="font-size: 9pt; font-family: Arial">Archivo:</span></strong>
                                    </td>
                                    <td style="vertical-align: super; height: 35px; text-align: left; width: 661px;">
                                        <asp:FileUpload ID="FU_Archivo_Adjunto" runat="server" Font-Names="Arial" />
                                        <asp:RequiredFieldValidator ID="RFV_Archivo_Adjunto" runat="server" ErrorMessage="Campo requerido"
                                            ControlToValidate="FU_Archivo_Adjunto" ValidationGroup="Val_2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 35px; text-align: left; width: 17%;">
                                        <strong><span style="font-size: 9pt; font-family: Arial">Nombre Adjunto:</span></strong>
                                    </td>
                                    <td style="vertical-align: super; height: 35px; text-align: left; width: 661px;">
                                        <asp:TextBox ID="TB_Nombre_Adjunto" runat="server" Font-Names="Arial"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV_Nombre_Adjunto" runat="server" ErrorMessage="Campo requerido"
                                            ControlToValidate="TB_Nombre_Adjunto" ValidationGroup="Val_2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 31%; height: 32px; text-align: center">
                                        <asp:Button ID="B_Agregar_Archivo" runat="server" BackColor="Transparent" BorderColor="MidnightBlue"
                                            BorderStyle="Solid" Font-Bold="True" ForeColor="SteelBlue" Text="Agregar Archivo"
                                            Width="208px" BorderWidth="1px" Font-Underline="True" OnClick="B_Agregar_Archivo_Click"
                                            ValidationGroup="Val_2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top; width: 31%; height: 32px; text-align: left">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top; height: 35px; text-align: center">
                                        <span style="font-size: 9pt; font-family: Arial"></span>
                                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                            AllowPaging="True" AutoGenerateColumns="False" Width="90%" Font-Names="Arial"
                                            Font-Size="9pt" Style="vertical-align: top" PageSize="4" OnRowDeleting="GridView1_RowDeleting">
                                            <Columns>
                                                <asp:HyperLinkField DataNavigateUrlFields="ruta" DataNavigateUrlFormatString="{0}"
                                                    DataTextField="nombre" HeaderText="Nombre adjunto" />
                                                <asp:ButtonField Text="Eliminar" CommandName="Delete" />
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
                            <table width="100%">
                            <tr>
                                    <td style="text-align: center; width: 50%">
                                        <asp:Button ID="B_Aceptar" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                            ForeColor="Navy" Text="Aceptar Solicitud" ValidationGroup="Val_1" Width="245px"
                                            OnClick="B_Solicitud" />
                                    </td>
                                    <td style="text-align: center; width: 50%">
                                        <asp:Button ID="B_Rechazar" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                            ForeColor="Navy" Text="Rechazar Solicitud" ValidationGroup="Val_1" Width="245px"
                                            OnClick="B_Rechazar_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

