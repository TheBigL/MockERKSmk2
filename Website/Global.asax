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

        //Add startup roles
        var roleManager = new RoleManager();
        roleManager.AddStartupRoles();

        //Load default admin acc.
        var userManager = new MockERKS.Framework.BLL.Security.UserManager();
        userManager.StartupUsers();
    }

</script>
