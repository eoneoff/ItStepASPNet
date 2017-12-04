using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PersonalInfoMVC.Models
{
    public class Person
    {
        public string FamilyName { get; set; }
        public string FirstName { get; set; }
        public string Patronim { get; set; }
        public string Sex { get; set; }
        public string City { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string[] Hobbies { get; set; }
    }
}