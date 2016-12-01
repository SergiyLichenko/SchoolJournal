using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolJournal.Common
{
    public class Mark
    {
        private Guid peopleId;
        private Guid subjectId;
        private byte value;
        private DateTime dateMark;
        public Guid PeopleId
        {
            get
            {
                return this.peopleId;
            }
            private set
            {
                this.peopleId = value;
            }
        }
        public Guid SubjectId
        {
            get
            {
                return this.subjectId;
            }
            private set
            {
                this.subjectId = value;
            }
        }
        public byte Value
        {
            get
            {
                return this.value;
            }
            private set
            {
                this.value = value;
            }
        }
        public DateTime DateMark
        {
            get
            {
                return this.dateMark;
            }
            private set
            {
                this.dateMark = value;
            }
        }
        public Mark(Guid peopleId, Guid subjectId, byte value, DateTime dateMark)
        {
            this.PeopleId = peopleId;
            this.SubjectId = subjectId;
            this.Value = value;
            this.DateMark = dateMark;
        }
    }
}
