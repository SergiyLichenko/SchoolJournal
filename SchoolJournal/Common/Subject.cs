using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolJournal.Common
{
    public class Subject:BaseClass
    {
        private Guid teacherId;
        public Guid TeacherId
        {
            get
            {
                return this.teacherId;
            }
            private set
            {
                this.teacherId = value;
            }
        }
        public Subject(Guid id, string name, Guid teacherID):base(id,name)
        {
            this.TeacherId = teacherID;
        }
    }
}
