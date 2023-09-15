var builder = WebApplication.CreateBuilder(args);

//---
//Add MVC
builder.Services.AddControllersWithViews();
//khai bao session
builder.Services.AddSession();
//---

var app = builder.Build();

//app.MapGet("/", () => "Hello World!");
//---
//dieu phoi url
app.UseRouting();
//su dung session
app.UseSession();
//khai bao de thu muc wwwroot thanh thu muc ao
app.UseStaticFiles();
//cau hinh url
app.MapControllerRoute(name: "area", pattern: "{area=exists}/{controller=Home}/{action=Index}/{id?}");
app.MapControllerRoute(name:"default",pattern:"{controller=Home}/{action=Index}/{id?}");
//---

app.Run();
