<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true" CodeFile="~/LogicaPresentacion/Login.aspx.cs" Inherits="Presentacion_Login" Title="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 30%; height: 21px;">
                &nbsp;</td>
            <td style="height: 21px">
                &nbsp;</td>
            <td style="height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 30%">
                &nbsp;</td>
            <td style="width: 40%">
                <table style="width: 100%">
                    <tr>
                        <td colspan="2" 
                            style="text-align: center; font-family: Arial, Helvetica, sans-serif; height: 35px;">
                            Inicio Sesión</td>
                    </tr>
                    <tr>
                        <td style="font-family: Arial, Helvetica, sans-serif; height: 30px; width: 40%;">
                            Nombre:</td>
                        <td style="height: 30px">
                            <asp:TextBox ID="Nombre" runat="server" Width="50%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="Nombre" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 21px; font-family: Arial, Helvetica, sans-serif; width: 108px;">
                            Paswword:</td>
                        <td style="height: 21px">
                            <asp:TextBox ID="Password" runat="server" Width="50%" TextMode="Password" 
                                style="margin-left: 0px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Password" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 23px; text-align: center">
                            <span style="font-family: Arial, Helvetica, sans-serif">
                            <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="10pt" 
                                ForeColor="Red"></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; height: 26px;">
                            <span style="font-family: Arial, Helvetica, sans-serif">
                            <asp:Button ID="Iniciar" runat="server" Text="Loggear" onclick="Iniciar_Click" 
                                ValidationGroup="Login" />
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 87px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

