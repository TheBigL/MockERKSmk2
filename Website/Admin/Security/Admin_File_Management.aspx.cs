using System;
using MockERKS.Framework.BLL;
using Microsoft.AspNet.Identity;
using MockERKS.Framework.Entities.Security;
using MockERKS.Framework.Entities;
using MockERKS.Framework.Entities.POCOs;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Admin_File_Management : System.Web.UI.Page
{
    string connectionString = @"Data Source=.;Initial Catalog=MockERKS;Integrated Security=true;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            PopulateGridView();
        }

    }

    void PopulateGridView()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlcon = new SqlConnection(connectionString))
        {
            sqlcon.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("SELECT [File_ID], [Type_ID], [Organization_ID], [Security_Classification_ID], [File_Status], [Closed_Date] FROM [Site_File]", sqlcon);
            sqlda.Fill(dtbl);

        }
        if (dtbl.Rows.Count > 0)
        {
            GVSitefile.DataSource = dtbl;
            GVSitefile.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            GVSitefile.DataSource = dtbl;
            GVSitefile.DataBind();
            GVSitefile.Rows[0].Cells.Clear();
            GVSitefile.Rows[0].Cells.Add(new TableCell());
            GVSitefile.Rows[0].Cells[0].Text = "No data Found";


        }
    }


    protected void GVSitefile_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVSitefile.EditIndex = e.NewEditIndex;

        PopulateGridView();
    }

    protected void GVSitefile_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVSitefile.EditIndex = -1;

        PopulateGridView();
    }

    protected void GVSitefile_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        

        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string query = "UPDATE Site_File SET (Type_ID=@Type_ID,Security_Classification_ID=@Security_Classification_ID,File_Status=@File_Status,Closed_Date=@Closed_Date WHERE File_ID = @File_ID";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);


                sqlCmd.Parameters.AddWithValue("Type_ID", Convert.ToInt32(GVSitefile.Rows[e.RowIndex].FindControl("TypeDDL") as DropDownList));
                sqlCmd.Parameters.AddWithValue("@Security_Classification_ID", Convert.ToInt32(GVSitefile.Rows[e.RowIndex].FindControl("securityclassDDL") as DropDownList));
                sqlCmd.Parameters.AddWithValue("@File_Status", (GVSitefile.Rows[e.RowIndex].FindControl("TextBox6") as DropDownList).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Closed_Date", Convert.ToDateTime(GVSitefile.Rows[e.RowIndex].FindControl("TextBox7") as TextBox));
                sqlCmd.Parameters.AddWithValue("@File_ID", Convert.ToInt32(GVSitefile.DataKeys[e.RowIndex].Value.ToString()));

                sqlCmd.ExecuteNonQuery();
                GVSitefile.EditIndex = -1;
                PopulateGridView();
                SuccessMessage.Text = "selected record updated";

            }

        }
        catch (Exception ex)
        {
            SuccessMessage.Text = "";
            ErrorMessage.Text = ex.Message;
        }
    }


}


  




    
