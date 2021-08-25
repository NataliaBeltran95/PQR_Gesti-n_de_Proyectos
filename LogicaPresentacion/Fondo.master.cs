using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.IO;

public partial class Presentacion_Fondo : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter(new CultureInfo(0x240A));
        strWriter.Write(DateTime.Now.DayOfWeek + " " + DateTime.Now.ToShortDateString());
        this.LB_Hora_Fecha_Actual.Text = strWriter.ToString();
        switch (int.Parse(Session["Rol"].ToString()))
        {
            case 1:
                this.LoginStatus1.LogoutText = "<ul><li><a href='Login.aspx'>Cerrar sesión</a></li></ul>";
                Administrador.Visible = true;
                break;
            case 2:
                this.LoginStatus1.LogoutText = "<ul><li><a href='Login.aspx'>Cerrar sesión</a></li></ul>";
                Funcionario.Visible = true;
                break;
            case 3:
                this.LoginStatus1.LogoutText = "<ul><li><a href='Login.aspx'>Cerrar sesión</a></li></ul>";
                Operador.Visible = true;
                break;
        }
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {

    }
}
