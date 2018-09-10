using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PublishingHouse.Startup))]
namespace PublishingHouse
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
