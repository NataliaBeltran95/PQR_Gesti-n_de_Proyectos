using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;


public partial class Presentacion_Crear_Usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void B_I_Usuario(object sender, EventArgs e)
    {
        try
        {
            BO_Usuario BOusuario = new BO_Usuario(
                int.Parse(TB_Cedula.Text), 
                TB_Apellidos.Text, 
                TB_Nombres.Text, 
                DateTime.Parse(TB_FecNac.Text), 
                int.Parse(TB_Edad.Text),
                TB_Contra.Text, 
                TB_Correo_Electronico.Text, 
                int.Parse(DDL_Rol.SelectedValue), 
                int.Parse(DDL_Dependencia.SelectedValue), 
                TB_Loggin.Text);
            IAD_Usuario IADusuario = new IAD_Usuario();
            IADusuario.CrearUsuario(BOusuario);
        }
        catch (Exception ex)
        {

        }
        this.RegisterStartupScript("mensaje","<script type='text/javascript'>alert('Usuario creado con exito');window.location=\"Crear_Usuario.aspx\"</script>");
    }
}
