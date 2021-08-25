using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Presentacion_Modificar_Actividad : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {   
        TB_Fecha_Inicio.Text = DateTime.Now.ToShortDateString();
        int Id_Solicitud;
        
        if (!IsPostBack)
        {
            DataTable Solicitud = new DataTable();
            DataTable Imagen = new DataTable();
            DataTable Archivo = new DataTable();
            Id_Solicitud = int.Parse(Request.QueryString.Get(0));
            Session["fotos"] = null;
            Session["archivos"] = null;
            Solicitud Sol = new Solicitud();
            Solicitud = Sol.SelectSolicitud(Id_Solicitud);
            TB_Fecha_Inicio.Text = DateTime.Parse(Solicitud.Rows[0]["Fecha_Ingreso"].ToString()).ToShortDateString();
            TB_Apellidos.Text = Solicitud.Rows[0]["Apellidos"].ToString();
            TB_Nombres.Text = Solicitud.Rows[0]["Nombre"].ToString();
            TB_Mensaje.Text = Solicitud.Rows[0]["Mensaje"].ToString();
            Imagen = Sol.SelectImagen(Id_Solicitud);
            Archivo = Sol.SelectArchivo(Id_Solicitud);
            if (!(Imagen.Rows[0]["ruta"].ToString().Equals("")))
            {
                GridView3.DataSource = Imagen;
                GridView3.DataBind();
            }
            if (!(Archivo.Rows[0]["nombre"].ToString().Equals("")))
            {
                GridView1.DataSource = Archivo;
                GridView1.DataBind();
            }
            Session["Sol"] = Id_Solicitud;
            
        }
    }
    protected void B_Solicitud(object sender, EventArgs e)
    {
        Session["fotos"] = null;
        Session["archivos"] = null;
        this.Response.Redirect("Final_Solicitud.aspx");
    }
}
