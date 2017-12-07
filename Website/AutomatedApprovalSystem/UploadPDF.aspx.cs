using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_UploadPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientPage.aspx");
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        //Label2.Visible = true;
        //string filePath = FileUpload.PostedFile.FileName;
        //string filename1 = Path.GetFileName(filePath);
        //string ext = Path.GetExtension(filename1);
        //string type = String.Empty;

        //if (FileUpload.HasFile)
        //{
        //    try
        //    {
        //        switch (ext)
        //        {
        //            case ".pdf":
        //                type = "application/pdf";
        //                break;
        //        }

        //        if (type != String.Empty)
        //        {
        //            connection();
        //            Stream fs = FileUpload.PostedFile.InputStream;
        //            BinaryReader br = new BinaryReader(fs);
        //            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        //            query = "insert into PDFFiles (Name,type,data)" + " values (@Name, @type, @Data)";
        //            com = new SqlCommand(query, con);
        //            com.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename1;
        //            com.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
        //            com.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
        //            com.ExecuteNonQuery();
        //            Label2.ForeColor = System.Drawing.Color.Green;
        //            Label2.Text = "File Uploaded Successfully";
        //        }
        //        else
        //        {
        //            Label2.ForeColor = System.Drawing.Color.Red;
        //            Label2.Text = "Select Only PDF Files ";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Label2.Text = "Error: " + ex.Message.ToString();
        //    }
        //}
    }

    protected void View_Click(object sender, EventArgs e)
    {
        //connection();
        //query = "Select *from PDFFiles";
        //SqlDataAdapter da = new SqlDataAdapter(query, con);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //GridView1.DataSource = ds;
        //GridView1.DataBind();
        //con.Close();
    }

    protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //connection();
        //SqlCommand com = new SqlCommand("select Name,type,data from PDFFiles where id=@id", con);
        //com.Parameters.AddWithValue("id", GridView1.SelectedRow.Cells[1].Text);
        //SqlDataReader dr = com.ExecuteReader();
        //if (dr.Read())
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ContentType = dr["type"].ToString();
        //    Response.AddHeader("content-disposition", "attachment;filename=" + dr["Name"].ToString());
        //    Response.Charset = "";
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.BinaryWrite((byte[])dr["data"]);
        //    Response.End();
        //}
    }
}