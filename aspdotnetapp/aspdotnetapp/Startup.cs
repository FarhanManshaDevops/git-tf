using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(aspdotnetapp.Startup))]
namespace aspdotnetapp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
