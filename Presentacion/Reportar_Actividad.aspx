<%@ Page Language="C#" MasterPageFile="~/Presentacion/Fondo.master" AutoEventWireup="true"
    CodeFile="~/LogicaPresentacion/Reportar_Actividad.aspx.cs" Inherits="Presentacion_Reportar_Actividad"
    Title="Registro Solicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="padding-right: 10px; padding-left: 10px;
        font-weight: bold; font-size: 12pt; padding-bottom: 10px; margin: 10px; width: 98%;
        color: navy; padding-top: 10px; font-family: Arial">
        <tr>
            <td style="border-right: navy 1px solid; border-top: navy 1px solid; border-left: navy 1px solid;
                border-bottom: navy 1px solid; text-align: left">
                <span style="font-size: 14pt; color: navy;">OPERARIO - Registro Solicitud </span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <span style="font-size: 10pt; color: red">Los campos marcados con asterisco (*) son
                    obligatorios</span>
                <br />
                <br />
                <table style="width: 100%">
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
                                            <asp:TextBox ID="TB_Apellidos" runat="server" Font-Names="Arial" Width="30%"></asp:TextBox>
                                            *</span>&nbsp;<asp:RequiredFieldValidator ID="RFV_Fecha_Inicio0" runat="server" ControlToValidate="TB_Apellidos"
                                                ErrorMessage="Campo requerido" Font-Names="Arial" Font-Size="9pt" ValidationGroup="Val_1"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left; height: 28px;">
                                        Nombres:
                                    </td>
                                    <td style="width: 30%; text-align: left; height: 28px;">
                                        <asp:TextBox ID="TB_Nombres" runat="server" Font-Names="Arial" Width="30%"></asp:TextBox>
                                        <span style="font-size: 14pt; color: #ff0000">*</span>&nbsp;<asp:RequiredFieldValidator
                                            ID="RFV_Fecha_Inicio1" runat="server" ControlToValidate="TB_Nombres" ErrorMessage="Campo requerido"
                                            Font-Names="Arial" Font-Size="9pt" ValidationGroup="Val_1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Mensaje:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Mensaje" runat="server" Rows="5" TextMode="MultiLine" Width="97%"
                                            Height="96px" Font-Names="Arial"></asp:TextBox>
                                        <span style="font-size: 14pt; color: #ff0000">* </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Mensaje"
                                            ErrorMessage="Campo requerido" Font-Names="Arial" Font-Size="9pt" ValidationGroup="Val_1"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Tipo Solicitud:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:DropDownList ID="DDL_Tipo_Sol" runat="server">
                                            <asp:ListItem Value="1">Solicitudes</asp:ListItem>
                                            <asp:ListItem Value="2">Quejas y/o Reclamos</asp:ListItem>
                                            <asp:ListItem Value="3">Derechos Peticion</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Dependencia Pertinente:
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:DropDownList ID="DDL_Dependencia" runat="server" DataSourceID="Dependencia"
                                            DataTextField="Nombre" DataValueField="Id_Dependencia" Font-Bold="False" Font-Names="Arial"
                                            Width="250px">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="Dependencia" runat="server" SelectMethod="Select" TypeName="Dependencia">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 12%; text-align: left">
                                        Correo:&nbsp;
                                    </td>
                                    <td style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Correo" runat="server" Font-Names="Arial" Width="30%"></asp:TextBox>
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
                                <tr>
                                    <td colspan="2" style="height: 27px; text-align: center; background-color: #e8e8f8;">
                                        <span style="font-family: Arial; color: navy;"><strong>IMAGENES</strong></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: super; height: 35px; text-align: left; width: 12%">
                                        <strong><span style="font-size: 9pt; font-family: Arial">Archivo:</span></strong>
                                    </td>
                                    <td style="vertical-align: super; height: 35px; text-align: left;">
                                        <asp:FileUpload ID="FU_Archivo_Imagen" runat="server" Font-Names="Arial" />
                                        <asp:RequiredFieldValidator ID="RFV_Archivo_Imagen0" runat="server" ControlToValidate="FU_Archivo_Imagen"
                                            ErrorMessage="Campo requerido" ValidationGroup="VG_Imagen" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: super; height: 35px; text-align: left; width: 12%">
                                        &nbsp;
                                    </td>
                                    <td style="vertical-align: super; height: 35px; text-align: left;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: super; height: 35px; text-align: center">
                                        <asp:Button ID="Button1" runat="server" BackColor="Transparent" BorderColor="MidnightBlue"
                                            BorderStyle="Solid" Font-Bold="True" ForeColor="SteelBlue" Text="Agregar Foto"
                                            Width="40%" BorderWidth="1px" Font-Underline="True" OnClick="B_Agregar_Foto_Click"
                                            ValidationGroup="VG_Imagen" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: super; height: 35px; text-align: center">
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                            CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                                            Width="90%" PageSize="1" OnRowDeleting="GridView3_RowDeleting">
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
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" Text="[Eliminar]" Font-Underline="false"
                                                                                    CommandName="Delete"></asp:LinkButton>
                                                                            </td>
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
                                    <td style="width: 12%; text-align: left">
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
                                    <td style="height: 35px; text-align: left">
                                        <strong><span style="font-size: 9pt; font-family: Arial">Archivo:</span></strong>
                                    </td>
                                    <td style="vertical-align: super; height: 35px; text-align: left; width: 661px;">
                                        <asp:FileUpload ID="FU_Archivo_Adjunto" runat="server" Font-Names="Arial" />
                                        <asp:RequiredFieldValidator ID="RFV_Archivo_Adjunto" runat="server" ErrorMessage="Campo requerido"
                                            ControlToValidate="FU_Archivo_Adjunto" ValidationGroup="Val_2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 35px; text-align: left">
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
                                <tr>
                                    <td style="text-align: center" colspan="2">
                                        <asp:Button ID="B_Sol" runat="server" BackColor="Transparent" BorderColor="#4682b4"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                            ForeColor="Navy" Text="Registar Solicitud" ValidationGroup="Val_1" Width="245px"
                                            OnClick="B_Solicitud" />
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
