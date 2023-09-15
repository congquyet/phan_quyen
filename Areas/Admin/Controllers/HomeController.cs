using Microsoft.AspNetCore.Mvc;
using project.Areas.Admin.Attributes; //nhin thay cac file .cs ben trong folder Attributes

namespace project.Areas.Admin.Controllers
{
    //Trong Area phai co tag sau
    [Area("Admin")]
    //kiem tra xem user da dang nhap chua
    [CheckLogin]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
