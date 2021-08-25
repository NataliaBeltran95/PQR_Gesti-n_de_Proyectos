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

public partial class Presentacion_Consulta_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime Fecha_Solicitud, Fecha_Vig = DateTime.Now;
        string dia;
        int Tipo,Sol_global=0,quejas_global=0,derechos_global=0,filas;
        try
        {
            Dependencia List_Depend = new Dependencia();
            DataTable Dat_List_Depen = List_Depend.Select();
            Dat_List_Depen.Columns.Add("Derechos");
            Dat_List_Depen.Columns.Add("Solicitudes");
            Dat_List_Depen.Columns.Add("Quejas");
            Dat_List_Depen.Columns.Add("Total");
            Solicitud List_Sol = new Solicitud();
            DataTable dat_list_sol = List_Sol.SelectSolicitudes();
            for (int x = 0; Dat_List_Depen.Rows.Count>x; x++)
            {
                int sol = 0, quejas = 0, derechos = 0,total=0;
                int Id_depen = int.Parse(Dat_List_Depen.Rows[x]["Id_Dependencia"].ToString());
                for (int y = 0; dat_list_sol.Rows.Count > y; y++)
                {
                    if(int.Parse(dat_list_sol.Rows[y]["Id_Dependencia"].ToString())== Id_depen)
                        switch (int.Parse(dat_list_sol.Rows[y]["Tipo"].ToString()))
                        {
                            case 1:
                                sol++;
                                break;
                            case 2:
                                quejas++;
                                break;
                            case 3:
                                derechos++;
                                break;
                        }
                }
                total = sol + quejas + derechos;
                Sol_global = Sol_global + sol;
                derechos_global = derechos_global + derechos;
                quejas_global = quejas_global + quejas;
                Dat_List_Depen.Rows[x]["Derechos"] = derechos;
                Dat_List_Depen.Rows[x]["Solicitudes"] = sol;
                Dat_List_Depen.Rows[x]["Quejas"] = quejas;
                Dat_List_Depen.Rows[x]["Total"] = total;

            }
            DataRow row_total = Dat_List_Depen.NewRow();
            row_total["Id_Dependencia"] = 100;
            row_total["Nombre"] = "Total";
            row_total["Derechos"] = derechos_global;
            row_total["Solicitudes"] = Sol_global;
            row_total["Quejas"] = quejas_global;
            row_total["Total"] = derechos_global + Sol_global + quejas_global;
            Dat_List_Depen.Rows.Add(row_total);

            this.Grid_List_Depen.DataSource = Dat_List_Depen;
            this.Grid_List_Depen.DataBind();



            Seguimiento Sel = new Seguimiento();
            DataTable dataTable = Sel.SelectSeguim();
            dataTable.Columns.Add("Tipo1");
            dataTable.Columns.Add("Fecha1");
            dataTable.Columns.Add("Fecha3");
            for (int y = 0; y < (dataTable.Rows.Count-1); y++)
            {
                if (int.Parse(dataTable.Rows[y]["Id_Solicitud"].ToString()) == int.Parse(dataTable.Rows[(y + 1)]["Id_Solicitud"].ToString()))
                {
                    dataTable.Rows[y].Delete();
                    y++;
                }
                dataTable.Rows[y]["Fecha1"] = DateTime.Parse(dataTable.Rows[y]["Fecha"].ToString()).ToShortDateString();
                Fecha_Solicitud = DateTime.Parse(dataTable.Rows[y]["Fecha"].ToString());
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
                dataTable.Rows[y]["Fecha3"] = Fecha_Vig.ToShortDateString();
                Tipo = int.Parse(dataTable.Rows[y]["Tipo"].ToString());
                switch (Tipo)
                {
                    case 1:
                        dataTable.Rows[y]["Tipo1"] = "Solicitud";
                        break;
                    case 2:
                        dataTable.Rows[y]["Tipo1"] = "Queja y/o Reclamo";
                        break;
                    case 3:
                        dataTable.Rows[y]["Tipo1"] = "Derecho Peticion";
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}
