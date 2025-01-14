using Microsoft.EntityFrameworkCore;
using Travelinthai.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ApplicationDbContext>(Options => Options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(Options =>
{
    Options.LoginPath = "/Account/Login";
    Options.LogoutPath = "/Account/Logout";
    Options.SlidingExpiration = true;
    Options.ExpireTimeSpan = TimeSpan.FromMinutes(30);
    Options.Cookie.HttpOnly = true;
    Options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    Options.Cookie.Name = "MyAppAuthCookie";
    Options.Cookie.MaxAge = TimeSpan.Zero;
});

var app = builder.Build();


if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(

    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();
