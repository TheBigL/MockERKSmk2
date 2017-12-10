using Microsoft.AspNet.Identity;
using MockERKS.Framework.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_UploadPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientPage.aspx");
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        Label2.Visible = true;
        string filePath = FileUpload.PostedFile.FileName;
        string filename1 = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename1);
        string type = String.Empty;
        string Id = getUserID().ToString();
        if (!FileUpload.HasFile)
        {
            Label2.Text = "Please Select File"; //if file uploader has no file selected  
        }
        else if (FileUpload.HasFile)
        {
            try
            {
                switch (ext) // this switch code validate the files which allow to upload only PDF file
                {
                    case ".pdf":
                        type = "application/pdf";
                        break;
                }

                if (type != String.Empty)
                {
                    //connection();
                    SqlConnection con = new SqlConnection("server=(local);database=MockERKS;Trusted_Connection=yes");
                    try
                    {
                        con.Open();
                        Stream fs = FileUpload.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs); //reads the binary files
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length); //counting the file length into bytes
                        string query = "insert into SavePDF (PDF_Name,PDF_Type,PDF_Data, Organization_ID)" + " values (@Name, @type, @Data, @id)"; //insert query
                        SqlCommand comm = new SqlCommand(query, con);
                        comm.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename1;
                        comm.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
                        comm.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
                        comm.Parameters.Add("@id", SqlDbType.Int).Value = Id;
                        comm.ExecuteNonQuery();
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "File Uploaded Successfully";
                        Gridview1.DataBind();
                    }
                    catch(Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                    }
                   
                }
                else
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "Select Only PDF Files "; // if file is other than speified extension
                }
            }
            catch (Exception ex)
            {
                Label2.Text = "Error: " + ex.Message.ToString();
            }
        }
    }

    protected void View_Click(object sender, EventArgs e)
    {
        //connection();
        SqlConnection con = new SqlConnection("server=(local);database=MockERKS;Trusted_Connection=yes");
        //string query = "Select * from SavePDF where SavePDF.Organization_ID = @orgaId";
        SqlCommand com = new SqlCommand("Select * from SavePDF where SavePDF.Organization_ID = @orgaId", con);
        com.Parameters.AddWithValue("orgaId", getUserID());
        con.Open();       
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = com;
        //DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(dt);
        Gridview1.DataSource = dt;
        Gridview1.DataBind();
        con.Close();
    }

    protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("server=(local);database=MockERKS;Trusted_Connection=yes");
        SqlCommand com = new SqlCommand("select PDF_Name,PDF_Type,PDF_Data from SavePDF where id=@id", con);
        com.Parameters.AddWithValue("id", Gridview1.SelectedRow.Cells[1].Text);
        try
        {
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = dr["PDF_Type"].ToString();
                Response.AddHeader("content-disposition", "attachment;filename=" + dr["PDF_Name"].ToString()); // to open file prompt Box open or Save file
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite((byte[])dr["PDF_Data"]);
                Response.End();
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
        
    }

    protected int getUserID()
    {
        string userName = Context.User.Identity.GetUserName();
        FileController sysmgr = new FileController();
        int id = sysmgr.OrganizationId_get(userName);
        return id;
    }
}