using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Proiect_Colectiv.Controllers
{
    public class MedicController : Controller
    {
       

       // GET: Medic/Create
        public ActionResult CreateMedic()
        {
            return View();
        }

        // POST: Medic/Create
        [HttpPost]
        public ActionResult CreateMedic(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Medic/Edit/5
        public ActionResult EditMedic(int id)
        {
            return View();

        }

        // POST: Medic/Edit/5
        [HttpPost]
        public ActionResult EditMedic(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Medic/Delete/5
        public ActionResult DeleteMedic(int id)
        {
            return View();

        }

        // POST: Medic/Delete/5
        [HttpPost]
        public ActionResult DeleteMedic(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
