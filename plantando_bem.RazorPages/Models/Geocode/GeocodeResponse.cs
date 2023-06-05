using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Geocode
{
    public class GeocodeResponse
    {
        public List<GeocodeResult>? Results { get; set; }
    }
}