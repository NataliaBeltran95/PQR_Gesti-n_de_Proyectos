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
/// Descripción breve de Solicitud
/// </summary>
public class Solicitud
{
	public Solicitud()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public long CrearSolicitud(BO_Solicitud BOsolicitud)
    {
        DataTable Prueba = new DataTable();
        long Id_Sol;
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        try
        {
            conection.Open();
            MySqlCommand command = new MySqlCommand("SP_CREAR_SOLICITUD", conection);
            command.CommandType = CommandType.StoredProcedure;

            
            command.Parameters.Add("Tip", MySqlDbType.Int32 ).Value = BOsolicitud.Tipo;
            command.Parameters.Add("Nomb", MySqlDbType.VarChar, 20).Value = BOsolicitud.Nombre;
            command.Parameters.Add("Ape", MySqlDbType.VarChar, 20).Value = BOsolicitud.Apellidos;
            command.Parameters.Add("Fe_In",MySqlDbType.DateTime).Value = DateTime.Now;
            command.Parameters.Add("Men", MySqlDbType.VarString, 100 ).Value = BOsolicitud.Mensaje;
            command.Parameters.Add("Id_Dep", MySqlDbType.Int32 ).Value = BOsolicitud.IdDep;
            command.Parameters.Add("Arch", MySqlDbType.VarChar, 50).Value = BOsolicitud.Archivo;
            command.Parameters.Add("Imag", MySqlDbType.VarChar, 50).Value = BOsolicitud.Imagen;
            command.Parameters.Add("Corr", MySqlDbType.VarChar, 30).Value = BOsolicitud.Correo;

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
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_NUMERO_SOLICITUD", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(Prueba);
            Id_Sol=long.Parse(Prueba.Rows[0][0].ToString());
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
        return Id_Sol;
    }
    public DataTable SelectSolicitud(int IdSol)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_SOLICITUD", dataConnection);
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

    public DataTable SelectSolicitud_Respuesta(int IdSol,int IdEst)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_RESPUESTA", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdSol", MySqlDbType.Int16, 5).Value = IdSol;
            dataAdapter.SelectCommand.Parameters.Add("IdEst", MySqlDbType.Int16, 3).Value = IdEst;

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

    public DataTable SelectSolicitudes()
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_LISTADO_SOLICITUDES", dataConnection);
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
    public DataTable SelectSolicitudes_Depend(int Id_Dependencia)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_LISTADO_SOLICITUDES_DEPENDENCIA", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdDepen", MySqlDbType.Int16, 3).Value = Id_Dependencia;


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
        DateTime Fecha_Solicitud, Fecha_Vig = DateTime.Now;
        string dia;
        int Tipo;
        dataTable.Columns.Add("Tipo1");
        dataTable.Columns.Add("Fecha1");
        dataTable.Columns.Add("Fecha3");
        for (int y = 0; y < (dataTable.Rows.Count); y++)
        {
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
                default:
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
        return dataTable;
    }

    public DataTable SelectImagen(int IdSol)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_IMAGENES", dataConnection);
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

    public DataTable SelectImagen_Respuesta(int IdSol,int IdEst)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_IMAGENES_RESPUESTA", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdSol", MySqlDbType.Int16, 5).Value = IdSol;
            dataAdapter.SelectCommand.Parameters.Add("IdEst", MySqlDbType.Int16, 3).Value = IdEst;

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

    public DataTable SelectArchivo(int IdSol)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_ARCHIVO", dataConnection);
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

     public DataTable SelectArchivoRespuesta(int IdSol,int IdEst)
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_CARGAR_ARCHIVO_RESPUESTA", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("IdSol", MySqlDbType.Int16, 5).Value = IdSol;
            dataAdapter.SelectCommand.Parameters.Add("IdEst", MySqlDbType.Int16, 3).Value = IdEst;

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
