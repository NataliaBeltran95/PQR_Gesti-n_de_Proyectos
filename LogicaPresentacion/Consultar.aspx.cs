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

public partial class Presentacion_Consultar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Ingresar_Click(object sender, EventArgs e)
    {
        DateTime Fecha_Solicitud, Fecha_Vig = DateTime.Now;
        int Id_Solicitud;
        string dia;
        int Tipo;
        try
        {
            Id_Solicitud = int.Parse(Tb_Sol.Text);
            Solicitud Sol = new Solicitud();
            DataTable dataTable = Sol.SelectSolicitud(Id_Solicitud);
            if (dataTable.Rows.Count == 0)
            {
                this.Solicitud.Visible = false;
                Label1.Text = "Ese No. Solictud No Existe.";
            }
            else
            {
                dataTable.Columns.Add("Tipo1");
                dataTable.Columns.Add("Fecha");
                dataTable.Columns.Add("Fecha3");
                dataTable.Rows[0]["Fecha"] = DateTime.Parse(dataTable.Rows[0]["Fecha_Ingreso"].ToString()).ToShortDateString();
                Fecha_Solicitud = DateTime.Parse(dataTable.Rows[0]["Fecha_Ingreso"].ToString());
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
                }
                dataTable.Rows[0]["Fecha3"] = Fecha_Vig.ToShortDateString();
                Tipo = int.Parse(dataTable.Rows[0]["Tipo"].ToString());
                switch (Tipo)
                {
                    case 1:
                        dataTable.Rows[0]["Tipo1"] = "Soicitud";
                        break;
                    case 2:
                        dataTable.Rows[0]["Tipo1"] = "Queja y/o Reclamo";
                        break;
                    case 3:
                        dataTable.Rows[0]["Tipo1"] = "Derecho Peticion";
                        break;
                }
                Label1.Text = "";
                Seguimiento Seguimiento = new Seguimiento();
                DataTable Segui= Seguimiento.SelectSeguimiento(Id_Solicitud);
                Segui.Columns.Add("Fecha1");
                Segui.Rows[0]["Fecha1"] = DateTime.Parse(Segui.Rows[0]["Fecha"].ToString()).ToShortDateString();
                this.Solicitud.DataSource = dataTable;
                this.Solicitud.DataBind();
                this.Solicitud.Visible = true;
                this.Seguim.DataSource = Segui;
                this.Seguim.DataBind();
                this.Seguim.Visible = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
