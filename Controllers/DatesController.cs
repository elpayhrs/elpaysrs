using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebDate;

namespace WebDate.Controllers
{
    public class DatesController : ApiController
    {
        private WebDateDBEntities db = new WebDateDBEntities();

        // GET: api/Dates
        public IQueryable<Date> GetDates()
        {
            return db.Dates;
        }

        // GET: api/Dates/5
        [ResponseType(typeof(Date))]
        public IHttpActionResult GetDate(int id)
        {
            Date date = db.Dates.Find(id);
            if (date == null)
            {
                return NotFound();
            }

            return Ok(date);
        }

        // PUT: api/Dates/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDate(int id, Date date)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != date.ID)
            {
                return BadRequest();
            }

            db.Entry(date).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DateExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Dates
        [ResponseType(typeof(Date))]
        public IHttpActionResult PostDate(Date date)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Dates.Add(date);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = date.ID }, date);
        }
        public class con
        {
            [JsonConverter(typeof(OnlyDateConverter))]
            public DateTime Bar { get; set; }
        }

        public class OnlyDateConverter : IsoDateTimeConverter
        {
            public OnlyDateConverter()
            {
                DateTimeFormat = "yyyy-MM-dd";
            }
        }


        // DELETE: api/Dates/5
        [ResponseType(typeof(Date))]
        public IHttpActionResult DeleteDate(int id)
        {
            Date date = db.Dates.Find(id);
            if (date == null)
            {
                return NotFound();
            }

            db.Dates.Remove(date);
            db.SaveChanges();

            return Ok(date);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DateExists(int id)
        {
            return db.Dates.Count(e => e.ID == id) > 0;
        }
    }
}