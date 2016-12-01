using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolJournal.Common
{
    public class Teacher : BaseClass
    {
        private string password;
        public string Password
        {
            get
            {
                return this.password;
            }
            private set
            {
                this.password = value;
            }
        }
        public Teacher(Guid id, string name, string password) : base(id, name)
        {
            this.Password = password;
        }
    }
}
