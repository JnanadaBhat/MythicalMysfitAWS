using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MysfitsController : ControllerBase
    {
        // GET: api/<MysfitsController>
        [HttpGet]
        public IActionResult Get()
        {
            using(StreamReader stream = new StreamReader("../mysfits-response.json"))
            {
                var json = stream.ReadToEnd();
                return new JsonResult(JObject.Parse(json));
            }
        }
    }
}
