<%@ Application Language="C#" %>
<%@ Import Namespace="Website" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="MockERKS.Framework.BLL.Security" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);


        var roleManager = new RoleManager();
        roleManager.AddStartupRoles();


        var userManager = new MockERKS.Framework.BLL.Security.UserManager();
        userManager.AddStaff();
        userManager.AddWebMaster();
    }

</script>
