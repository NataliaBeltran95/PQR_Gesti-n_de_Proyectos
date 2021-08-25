<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true"
    CodeFile="~/LogicaPresentacion/Crear_Usuario.aspx.cs" Inherits="Presentacion_Crear_Usuario"
    Title="Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
        <tr>
            <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                border-bottom: navy 1px solid; text-align: left">
                <span style="font-size: 14pt; color: navy;">ADMINISTRACIÓN - Ingresar Usuario </span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <br />
                <br />
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%">
                            <table style="font-weight: bold; font-size: 10pt; width: 100%; color: navy; font-family: Arial">
                                <tr>
                                    <td style="width: 20%; text-align: left">
                                        Cédula:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Cedula" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" EnableViewState="true" ValidationGroup="grupoV1" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_cedula" runat="server" ControlToValidate="TB_Cedula" ErrorMessage="*" ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="width: 20%; text-align: left">
                                        Correo Electrónico:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Correo_Electronico" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" EnableViewState="true" ValidationGroup="grupoV1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rf_correo" runat="server" ControlToValidate="TB_Correo_Electronico" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; text-align: left">
                                        Dependencia:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:DropDownList ID="DDL_Dependencia" runat="server" DataSourceID="Dependencia"
                                            DataTextField="Nombre" DataValueField="Id_Dependencia" Font-Bold="False" Font-Names="Arial"
                                            Width="250px">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="Dependencia" runat="server" SelectMethod="Select" TypeName="Dependencia">
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td style="width: 20%; text-align: left">
                                        Rol Asignado:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:DropDownList ID="DDL_Rol" runat="server" DataSourceID="Rol" DataTextField="Nombre"
                                            DataValueField="Id_Rol" Font-Bold="False" Font-Names="Arial" Width="250px">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="Rol" runat="server" SelectMethod="SelectActivo" TypeName="Roles">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; text-align: left; height: 40px;">
                                        Apellidos:
                                    </td>
                                    <td style="width: 30%; text-align: left; height: 40px;">
                                        <asp:TextBox ID="TB_Apellidos" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False" ForeColor="Black"
                                            ReadOnly="false" EnableViewState="true" ValidationGroup="grupoV1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_apellidos" runat="server" ControlToValidate="TB_Apellidos" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="width: 20%; text-align: left; height: 40px;">
                                        Nombres:
                                    </td>
                                    <td style="width: 30%; text-align: left; height: 40px;">
                                        <asp:TextBox ID="TB_Nombres" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Width="250px" Enabled="True" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" EnableViewState="true" ValidationGroup="grupoV1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_name" runat="server" ControlToValidate="TB_Nombres" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; text-align: left">
                                        Nombre de Usuario:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Loggin" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Enabled="True" EnableViewState="true" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" ValidationGroup="grupoV1" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_username" runat="server" ControlToValidate="TB_Loggin" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="width: 20%; text-align: left">
                                        Contraseña:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Contra" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Enabled="True" EnableViewState="true" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" ValidationGroup="grupoV1" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_password" runat="server" ControlToValidate="TB_Contra" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; text-align: left">
                                        Fecha Nacimiento:&nbsp;
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_FecNac" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" Enabled="True" EnableViewState="true" Font-Bold="False" ForeColor="WindowText"
                                            ReadOnly="false" ValidationGroup="grupoV1" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Rfv_borndate" runat="server" ControlToValidate="TB_FecNac" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="grupoV1" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="width: 20%; text-align: left">
                                        Edad:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Edad" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"
                                            Enabled="True" EnableViewState="true" Font-Bold="False" ForeColor="WindowText"
                                            ValidationGroup="grupoV1" Width="150px" MaxLength="2"></asp:TextBox>
                                        <asp:RangeValidator ID="RV_edad" runat="server" ControlToValidate="TB_Edad" ErrorMessage="*" MaximumValue="2" MinimumValue="2" SetFocusOnError="True" Type="Integer" ValidationGroup="grupoV1" Visible="False"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" colspan="4">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center" colspan="4">
                                        <asp:Button ID="B_Usuario" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                            ForeColor="Navy" Text="Insertar Usuario" ValidationGroup="grupoV1" Width="245px"
                                            OnClick="B_I_Usuario" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
