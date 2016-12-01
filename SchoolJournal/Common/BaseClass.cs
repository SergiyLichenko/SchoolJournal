using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolJournal.Common
{
    public abstract class BaseClass
    {
        private Guid id;
        private string name;

        public Guid Id
        {
            get
            {
                return this.id;
            }
            protected set
            {
                this.id = value;
            }
        }
        public string Name
        {
            get
            {
                return this.name;
            }
            set
            {
                this.name = value;
            }
        }

        public BaseClass(Guid id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
    }
}
