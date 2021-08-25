using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Descripción breve de IAD_Seguimiento
/// </summary>
public class IAD_Seguimiento
{
    public IAD_Seguimiento()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public void Seguimiento(BO_SEguimiento BOseguimiento)
    {
        Seguimiento DAOseguimiento = new Seguimiento();
        DAOseguimiento.Insertar_Seguimiento(BOseguimiento);
    }
    public void Modificar(long Id_Sol,int i)
    {
        Seguimiento DAOseguimiento = new Seguimiento();
        DAOseguimiento.Mod_Seguimiento(Id_Sol,i);
    }
}