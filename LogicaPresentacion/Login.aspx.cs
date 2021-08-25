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
using MySql.Data.MySqlClient;

public partial class Presentacion_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["Id_Usuario"] = null;
        Session["Rol"] = 0;
        Session["Dep"] = null;
        L_error.Text = "";
        if (Session["Rol"] != null) {

            Response.Redirect("Login.aspx");
        
        
        }
        //Session["Id_Usuario"] = null;
        //Session["Rol"] = 0;
        //Session["Dep"] = null;
        //L_error.Text = "";
    }
    protected void Iniciar_Click(object sender, EventArgs e)
    {
        DataTable Usuario = new DataTable();
        Usuario User = new Usuario();
        Usuario = User.Login(Nombre.Text, Password.Text);

        if (Usuario.Rows.Count > 0)
        {
            Session["Id_Usuario"] = Usuario.Rows[0]["Id_Usuario"].ToString();
            Session["Rol"] = Usuario.Rows[0]["Id_Rol"].ToString();
            Session["Username"] = Usuario.Rows[0]["nombres"].ToString();



            if (int.Parse(Usuario.Rows[0]["Id_Rol"].ToString()) == 1)
  
                Session["Username"] = "Administrador";
            ////ClientScript.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Bienvenido Administrador');window.location=\"Crear_Usuario.aspx\"</script>");
           
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Bienvenido Administrador');window.location=\"Crear_Usuario.aspx\"</script>");
            if (int.Parse(Usuario.Rows[0]["Id_Rol"].ToString()) == 2)
            {
                Session["Username"] = "Funcionario"; 
                Session["Dep"] = int.Parse(Usuario.Rows[0]["Id_Dependencia"].ToString());
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Bienvenido Funcionario');window.location=\"Listado_Consultar.aspx\"</script>");
            }

            if (int.Parse(Usuario.Rows[0]["Id_Rol"].ToString()) == 3)

                Session["Username"] = "Operador"; 
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Bienvenido Operador');window.location=\"Reportar_Actividad.aspx\"</script>");
        }
        else
            L_error.Text = "Usuario o Contraseña incorrecta.";
    }
}
