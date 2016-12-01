using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SchoolJournal.Common;
using SchoolJournal.DAL;
using System.Data.SqlClient;
using System.Data;

namespace SchoolJournal
{
    public partial class LogIn : Form
    {
        private DataTable allTeachers;
        public LogIn()
        {
            InitializeComponent();

            this.listBox_Teachers.DisplayMember = "Name";
            this.allTeachers = DataAccessLayer.AllTeachers;
            this.listBox_Teachers.DataSource = allTeachers;
        }

        private void button_LogIn_Click(object sender, EventArgs e)
        {
            DataRowView row = this.listBox_Teachers.SelectedItem as DataRowView;
            if (row == null) return;
            string name = row["Name"].ToString();

            if (allTeachers.Select(String.Format("Name = '{0}' and Password = '{1}'",
                name, this.textBox1.Text.Trim())).Length != 0)
            {
                Teacher teacher = new Teacher(new Guid(row["ID"].ToString()), name,
                    row["Password"].ToString());
                Journal journal = new Journal(teacher);
                journal.Show();
            }
            else
                MessageBox.Show("Неверный логин/пароль");
        }
    }
}
