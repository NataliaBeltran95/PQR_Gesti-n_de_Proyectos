using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;

/// <summary>
/// Descripción breve de Seguimiento
/// </summary>
public class Seguimiento
{
    public Seguimiento()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public void Insertar_Seguimiento(BO_SEguimiento Seguimiento)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);

        try
        {
            conection.Open();
            MySqlCommand command = new MySqlCommand("SP_SEGUIMIENTO", conection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("IdDep", MySqlDbType.Int16, 2).Value = Seguimiento.IdDep;
            command.Parameters.Add("Flj", MySqlDbType.Int16, 2).Value = Seguimiento.Flujo;
            command.Parameters.Add("Fec", MySqlDbType.DateTime).Value = Seguimiento.Fecha.ToShortDateString();
            command.Parameters.Add("Obs", MySqlDbType.VarChar, 500).Value = Seguimiento.Mensaje;
            command.Parameters.Add("Arch", MySqlDbType.VarChar, 50).Value = Seguimiento.Archivo;
            command.Parameters.Add("Imag", MySqlDbType.VarChar, 50).Value = Seguimiento.Imagen;
            command.Parameters.Add("Id_Usu", MySqlDbType.Int32, 5).Value = Seguimiento.Id_Usu;
            command.Parameters.Add("Id_Est", MySqlDbType.Int16, 2).Value = Seguimiento.Id_Estado;
            command.Parameters.Add("Id_Sol", MySqlDbType.Int64, 10).Value = Seguimiento.Id_Sol;

            command.ExecuteNonQuery();
        }

        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
    public void Mod_Seguimiento(long Id_Sol,int i)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);

        try
        {
            conection.Open();
            MySqlCommand command = new MySqlCommand("SP_UPDATE_ESTADO", conection);
            command.CommandType = CommandType.StoredProcedure;            
            command.Parameters.Add("Id_Sol", MySqlDbType.Int64, 10).Value = Id_Sol;
            command.Parameters.Add("Fluj", MySqlDbType.Int16, 3).Value = i;

            command.ExecuteNonQuery();
        }

        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
    public DataTable SelectSolicitudes(int IdDep)
    {
        DateTime Fecha_Solicitud, Fecha_Vig=DateTime.Now;
        string dia;
        int Tipo;
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_SOLICTUDES_FUNCIONARIO", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdDep", MySqlDbType.Int16, 2).Value = IdDep;

            dataConnection.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        { 
            if (dataConnection != null)
            {
                dataConnection.Close();
            }
        }
        dataTable.Columns.Add("Fecha3");
        dataTable.Columns.Add("Fecha1");
        dataTable.Columns.Add("Tipo2");
        for (int y = 0; y < dataTable.Rows.Count; y++)
        {
            Fecha_Solicitud = DateTime.Parse(dataTable.Rows[y]["Fecha"].ToString());
            dataTable.Rows[y]["Fecha1"] = Fecha_Solicitud.ToShortDateString();
            dia =Fecha_Solicitud.DayOfWeek.ToString();
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
                    dataTable.Rows[y]["Tipo2"] = "Soicitud";
                    break;
                case 2:
                    dataTable.Rows[y]["Tipo2"] = "Queja y/o Reclamo";
                    break;
                case 3:
                    dataTable.Rows[y]["Tipo2"] = "Derecho Peticion";
                    break;

            }

        }
            return dataTable;
    }
    public DataTable SelectSeguimiento(int IdSol)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_SEGUIMIENTO", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdSol", MySqlDbType.Int16, 2).Value = IdSol;

            dataConnection.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (dataConnection != null)
            {
                dataConnection.Close();
            }
        }
        return dataTable;
    }
    public DataTable SelectSeguim()
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_TOTAL_SEGUIMIENTO", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataConnection.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (dataConnection != null)
            {
                dataConnection.Close();
            }
        }
        return dataTable;
    }
}
