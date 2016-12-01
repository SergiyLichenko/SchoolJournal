using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolJournal.Common
{
    public class People:BaseClass
    {
        private Guid classId;
        public Guid ClassId
        {
            get
            {
                return this.classId;
            }
            private set
            {
                this.classId = value;
            }
        }
        public People(Guid id, string name, Guid classID):base(id, name)
        {
            this.ClassId = classID;
        }
    }
}
