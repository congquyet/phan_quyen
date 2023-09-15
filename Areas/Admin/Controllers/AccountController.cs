using Microsoft.AspNetCore.Mvc;
using project.Models;
using BC = BCrypt.Net.BCrypt; //thu vien ma hoa password

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AccountController : Controller
    {
        //khoi tao doi tuong thao tac csdl
        public MyDbContext db = new MyDbContext();
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginPost(IFormCollection fc)
        {
            string _Email = fc["Email"];
            string _Password = fc["Password"];
            //ma hoa password
            //_Password = BC.HashPassword(_Password);
            //lay mot ban ghi tuong ung voi email, password
            ItemUser record = db.Users.Where(item=>item.Email == _Email).FirstOrDefault();
            if(record != null)
            {
                //return Content(_Password);
                //BC la doi tuong cua thu vien BCrypt
                if (BC.Verify(_Password,record.Password))
                {
                    //khoi tao session UserId
                    HttpContext.Session.SetString("admin_user_id", record.Id.ToString());
                    //khoi tao session Email
                    HttpContext.Session.SetString("admin_email", _Email);
                    //di chuyen den url
                    return Redirect("/Admin/Home");
                }
            }
            return Redirect("/Admin/Account/Login");
        }
        //logout
        public IActionResult Logout()
        {
            //huy session
            HttpContext.Session.Remove("admin_email");
            return Redirect("/Admin/Account/Login");
        }
    }
}
