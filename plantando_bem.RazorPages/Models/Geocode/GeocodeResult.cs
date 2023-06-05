using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Geocode
{
    public class GeocodeResult
    {
        public string? DisplayName { get; set; }
        public double Lat { get; set; }
        public double Lon { get; set; }
    }
}