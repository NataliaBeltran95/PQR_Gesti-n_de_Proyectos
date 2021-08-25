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

public partial class Presentacion_Final_Solicitud : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void B_Agregar_Archivo_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;

        DataTable archivos;

        if (Session["archivos"] == null)
        {
            archivos = new DataTable();
            archivos.Columns.Add("ruta");
            archivos.Columns.Add("nombre");
            Session["archivos"] = archivos;
        }

        archivos = (DataTable)Session["archivos"];

        if (archivos.Rows.Count == 1)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No se pueden agregar más archivos adjuntos');</script>");
            return;
        }

        int tamano = FU_Archivo_Adjunto.PostedFile.ContentLength;
        if (FU_Archivo_Adjunto.PostedFile.ContentLength > (1024 * 1024 * 4))
        {
            double tamanoMb = (double)((double)tamano / ((double)1024 * 1024));
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('No se pueden agregar archivos adjuntos de más de 4 Megabytes. Tamaño del archivo: {0:F1}MB');</script>", tamanoMb));
            return;
        }
        string nombreArchivo = System.IO.Path.GetFileName(FU_Archivo_Adjunto.PostedFile.FileName);
        string saveLocation = Server.MapPath("~\\FileUpload") + "\\" + nombreArchivo;

        if (System.IO.File.Exists(saveLocation))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo adjunto en el servidor con ese nombre');</script>");
            return;
        }

        try
        {
            FU_Archivo_Adjunto.PostedFile.SaveAs(saveLocation);
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo adjunto ha sido cargado');</script>");
        }
        catch (Exception exc)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('Error:{0}');</script>", exc.Message));
            return;
        }

        string[] celdas = new string[2];

        celdas[0] = "~\\FileUpload\\" + nombreArchivo;
        celdas[1] = TB_Nombre_Adjunto.Text;

        archivos.Rows.Add(celdas);

        Session["archivos"] = archivos;

        GridView1.DataSource = archivos;
        GridView1.DataBind();
        TB_Nombre_Adjunto.Text = "";
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable Archivos_eliminar = new DataTable();
        Archivos_eliminar = (DataTable)Session["archivos"];
        try
        {
            File.Delete(Server.MapPath(Archivos_eliminar.Rows[e.RowIndex]["ruta"].ToString()));
        }
        catch (Exception ex)
        {
        }
        Archivos_eliminar.Rows.RemoveAt(e.RowIndex);
        Session["archivos"] = Archivos_eliminar;
        GridView1.DataSource = Archivos_eliminar;
        GridView1.DataBind();
    }

    protected void B_Solicitud(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        DataTable archivos;
        long Id_Sol = long.Parse(Session["Sol"].ToString());
        string ruta_archivo = null;

        ////Creacion de registros de las plantillas cargadas por tipo de actividad

        if (Session["archivos"] != null)
        {
            archivos = (DataTable)Session["archivos"];
            ruta_archivo = archivos.Rows[0]["ruta"].ToString();
        }

        ////Persistencia de la actividad
        try
        {
            BO_SEguimiento Seg = new BO_SEguimiento(int.Parse(Session["Dep"].ToString()), 2, DateTime.Now, TB_Mensaje.Text, ruta_archivo, null, int.Parse(Session["Id_Usuario"].ToString()),2, Id_Sol);
            IAD_Seguimiento Seguim = new IAD_Seguimiento();
            Seguim.Seguimiento(Seg);
            Seguim.Modificar(Id_Sol,2);
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('La peticion fue Aceptada correctamente.');window.location=\"Listado_Consultar.aspx\"</script>"));
        }
        catch (Exception ex)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('Error: {0}');</script>", ex.Message));
            return;
        }
        Session["archivos"] = null;
    }
    protected void B_Rechazar_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        DataTable archivos;
        long Id_Sol = long.Parse(Session["Sol"].ToString());
        string ruta_archivo = null;

        ////Creacion de registros de las plantillas cargadas por tipo de actividad

        if (Session["archivos"] != null)
        {
            archivos = (DataTable)Session["archivos"];
            ruta_archivo = archivos.Rows[0]["ruta"].ToString();
        }

        ////Persistencia de la actividad
        try
        {
            BO_SEguimiento Seg = new BO_SEguimiento(int.Parse(Session["Dep"].ToString()), 2, DateTime.Now, TB_Mensaje.Text, ruta_archivo, null, int.Parse(Session["Id_Usuario"].ToString()), 3, Id_Sol);
            IAD_Seguimiento Seguim = new IAD_Seguimiento();
            Seguim.Seguimiento(Seg);
            Seguim.Modificar(Id_Sol,3);
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('La peticion fue Rechazada Correctamente.');window.location=\"Listado_Consultar.aspx\"</script>"));
        }
        catch (Exception ex)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('Error: {0}');</script>", ex.Message));
            return;
        }
        Session["archivos"] = null;

    }
}
