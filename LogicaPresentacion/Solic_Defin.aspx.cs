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

public partial class Presentacion_Solic_Defin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int Id_Solicitud;

        if (!IsPostBack)
        {
            String dia;
            DateTime Fecha_Solicitud, Fecha_Vig;
            DataTable Solicitud = new DataTable();
            DataTable Imagen = new DataTable();
            DataTable Archivo = new DataTable();
            DataTable Solicitud1 = new DataTable();
            DataTable Imagen1 = new DataTable();
            DataTable Archivo1 = new DataTable();
            Id_Solicitud = int.Parse(Request.QueryString.Get(0));
            Session["fotos"] = null;
            Session["archivos"] = null;
            Solicitud Sol = new Solicitud();
            Solicitud = Sol.SelectSolicitud(Id_Solicitud);
            TB_Fecha_Inicio.Text = DateTime.Parse(Solicitud.Rows[0]["Fecha_Ingreso"].ToString()).ToShortDateString();

            Fecha_Solicitud = DateTime.Parse(Solicitud.Rows[0]["Fecha_Ingreso"].ToString());
            dia = Fecha_Solicitud.DayOfWeek.ToString();
            switch (dia)
            {
                case "Monday":
                    Fecha_Vig = Fecha_Solicitud.AddDays(18);
                    break;
                case "Tuesday":
                    Fecha_Vig = Fecha_Solicitud.AddDays(20);
                    break;
                case "Wednesday":
                    Fecha_Vig = Fecha_Solicitud.AddDays(20);
                    break;
                case "Thursday":
                    Fecha_Vig = Fecha_Solicitud.AddDays(20);
                    break;
                case "Friday":
                    Fecha_Vig = Fecha_Solicitud.AddDays(20);
                    break;
                default:
                    Fecha_Vig = Fecha_Solicitud.AddDays(20);
                    break;
            }
            TextBox1.Text = Fecha_Vig.ToShortDateString();
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
            if (int.Parse(Solicitud.Rows[0]["Id_Estado"].ToString()) == 2 || int.Parse(Solicitud.Rows[0]["Id_Estado"].ToString()) == 3)
            {
                TextBox5.Visible = true;
                TextBox2.Visible = true;
                TextBox6.Visible = true;
                Solicitud1 = Sol.SelectSolicitud_Respuesta(Id_Solicitud, int.Parse(Solicitud.Rows[0]["Id_Estado"].ToString()));
                TextBox2.Text = DateTime.Parse(Solicitud1.Rows[0]["Fecha"].ToString()).ToShortDateString();
                TextBox5.Text = Solicitud1.Rows[0]["Observacion"].ToString();
                TextBox6.Text = Solicitud1.Rows[0]["Nombres"].ToString();
                Imagen1 = Sol.SelectImagen_Respuesta(Id_Solicitud,int.Parse(Solicitud.Rows[0]["Id_Estado"].ToString()));
                Archivo1 = Sol.SelectArchivoRespuesta(Id_Solicitud,int.Parse(Solicitud.Rows[0]["Id_Estado"].ToString()));
                if (!(Imagen1.Rows[0]["ruta"].ToString().Equals("")))
                {
                    GridView2.DataSource = Imagen1;
                    GridView2.DataBind();
                }
                if (!(Archivo1.Rows[0]["nombre"].ToString().Equals("")))
                {
                    GridView4.DataSource = Archivo1;
                    GridView4.DataBind();
                }


            }

        }

    }
}
