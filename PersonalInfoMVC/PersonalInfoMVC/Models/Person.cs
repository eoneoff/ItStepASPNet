using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PersonalInfoMVC.Models
{
    public class Person
    {
        public string FamilyName;
        public string FirstName;
        public string Patronim;
        public string Sex;
        public string City;
        public DateTime? DateOfBirth;
        public string[] Hobbies;
    }
}