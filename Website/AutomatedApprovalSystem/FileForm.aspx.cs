using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_FileForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        FileType.SelectedIndex = 0;
        Category.SelectedIndex = 0;
        SecurityClassification.SelectedIndex = 0;
        FileID.Text = "";
        OperationName.Text = "";
        OperationID.Text = "";
        Location.SelectedIndex = 0;
        Address.Text = "";
        Meridian.SelectedIndex = 0;
        Range.SelectedIndex = 0;
        Township.SelectedIndex = 0;
        Section.SelectedIndex = 0;
        QuarterSection.SelectedIndex = 0;
        LSD.SelectedIndex = 0;
        Plan.Text = "";
        Block.Text = "";
        Lot.Text = "";
        LINC.Text = "";
        FileStatus.SelectedIndex = 0;
        ClosedDate.SelectedDates.Clear();
    }
}