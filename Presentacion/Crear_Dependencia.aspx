<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Crear_Dependencia.aspx.cs" Inherits="Presentacion_Crear_Dependencia" Title="Página sin título" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
    <tr>
        <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
            border-bottom: navy 1px solid; text-align: left">
            <span style="font-size: 14pt; color: navy;">ADMINISTRACIÓN - Ingresar Dependencia </span>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <br />
            <span style="font-size: 10pt; color: red">Los campos marcados con asterisco (*) son obligatorios</span>
            <br />
            <br />
            <table style="width: 100%">
                <tr>
                    <td style="width: 100%">
                        <table style="font-weight: bold; font-size: 10pt; width: 100%; color: navy; font-family: Arial">
                            <tr>
                                <td style="width: 9%; text-align: left">
                                    Nombre:
                                </td>
                                <td style="width: 30%; text-align: left">
                                    <asp:TextBox ID="TB_Nombre" runat="server" BorderColor="Gray"
                                        BorderStyle="Solid" BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False"
                                        ForeColor="WindowText" ReadOnly="false" EnableViewState="true" 
                                        ValidationGroup="grupoV1"></asp:TextBox>
                                    <span style="font-size: 14pt; color: #ff0000">*</span></td>
                            </tr>
                            <tr>
                                <td style="width: 9%; text-align: left">
                                    Telefóno:
                                </td>
                                <td style="width: 30%; text-align: left">
                                    <asp:TextBox ID="TB_Telefono" runat="server" BorderColor="Gray"
                                        BorderStyle="Solid" BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False"
                                        ForeColor="WindowText" ReadOnly="false" EnableViewState="true" 
                                        ValidationGroup="grupoV1"></asp:TextBox>
                                    <span style="font-size: 14pt; color: #ff0000">*</span></td>
                            </tr>
                            <tr>
                                <td style="width: 9%; text-align: left">
                                    Dirección:
                                </td>
                                <td style="width: 30%; text-align: left">
                                    <span style="font-size: 14pt; color: #ff0000">
                                    <asp:TextBox ID="TB_Direccion" runat="server" BorderColor="Gray"
                                        BorderStyle="Solid" BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False"
                                        ForeColor="WindowText" ReadOnly="false" EnableViewState="true" 
                                        ValidationGroup="grupoV1"></asp:TextBox>
                                    *</span>
                                    </td>
                            </tr>
                            <tr>
                                <td style="text-align: left" colspan="2">
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="2">
                                    <asp:Button ID="B_Dependencia" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                        BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                        ForeColor="Navy" Text="Insertar Dependencia" ValidationGroup="grupoV1"
                                        Width="245px" OnClick="B_I_Usuario" />
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

