using Microsoft.AspNetCore.Mvc;
using System.IO; //thao tac voi file, thu muc
using Newtonsoft.Json;//thao tac voi file json
using System.Data;//su dung DataTalbe, DataRow
using System.Data.SqlClient;//su dung SqlConnection, DataAdapter...
using X.PagedList;//su dung cac ham phan trang
using BC = BCrypt.Net;//doi tuong ma hoa csdl, gan doi tuong nay thanh BC
using project.Models;//nhan dien cac file trong thu muc Models
using System.Security.Cryptography;
using project.Areas.Admin.Attributes;

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    [CheckLogin]
    public class TagsController : Controller
    {
        //doi tuong thao tac csdl
        public MyDbContext db = new MyDbContext();
        public IActionResult Index(int? page)
        {
            //khai bao so ban ghi tren mot trang
            int pageSize = 50;
            //tinh so trang
            int pageNumber = page ?? 1;//neu page = null thi PageNumber = 1; neu page != null thi PageNumber = page
            //List<ItemUser> list_Tags = db.Tags.OrderByDescending(item=>item.Id).ToList();
            //cach 2
            List<ItemTag> list_tags = (from item in db.Tags orderby item.Id descending select item).ToList();
            return View(list_tags.ToPagedList(pageNumber, pageSize));
        }
        //update
        public IActionResult Update(int? id)
        {
            int _id = id ?? 0;
            //khai bao bien action de dua vao tham so action cua the form
            ViewBag.action = "/Admin/Tags/UpdatePost/" + _id;
            //lay mot ban ghi
            var record = db.Tags.Where(item => item.Id == _id).FirstOrDefault();
            return View("CreateUpdate", record);
        }
        //update post
        [HttpPost]
        public IActionResult UpdatePost(int? id, IFormCollection fc)
        {
            int _id = id ?? 0;
            //lay mot ban ghi
            var record = db.Tags.Where(item => item.Id == _id).FirstOrDefault();
            //---
            //ham .Trim() de cat khoang trang ben trai va ben phai cua chuoi
            string _Name = fc["Name"].ToString().Trim();//cac dung IFormCollection
            if (record != null)
            {
                record.Name = _Name;
                db.SaveChanges();
            }
            //---
            return RedirectToAction("Index");
        }
        //create
        public IActionResult Create()
        {
            //khai bao bien action de dua vao tham so action cua the form
            ViewBag.action = "/Admin/Tags/CreatePost";
            return View("CreateUpdate");
        }
        //create post
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            ItemTag record = new ItemTag();
            record.Name = _Name;
            //them ban ghi
            db.Tags.Add(record);
            //cap nhat thong tin 
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    //delete
    public IActionResult Delete(int? id)
    {
        int _id = id ?? 0;
        //lay mot ban ghi
        ItemTag record = db.Tags.Where(item => item.Id == _id).FirstOrDefault();
        //xoa ban ghi nay
        db.Tags.Remove(record);
        db.SaveChanges();
        return RedirectToAction("Index");
    }
}
}

