using Microsoft.EntityFrameworkCore;
using Travelinthai.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ApplicationDbContext>(Options => Options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(Options =>
{
    Options.LoginPath = "/Account/Login";
    Options.LogoutPath = "/Account/Logout";
    Options.SlidingExpiration = true;
    Options.ExpireTimeSpan = TimeSpan.FromMinutes(30); //เวลาหมดอายุของคุกกี้
    Options.Cookie.HttpOnly = true;
    Options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    Options.Cookie.Name = "MyAppAuthCookie";
    Options.Cookie.MaxAge = TimeSpan.Zero; //หมดอายุทันทีหลังออกจากระบบ
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
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
