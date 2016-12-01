using SchoolJournal.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;
using SchoolJournal.Common;
using SchoolJournal.DAL;

namespace SchoolJournal
{
    public partial class Journal : Form
    {
        public Teacher CurrentTeacher { get; private set; }


        private List<Subject> subjects;
        private List<Class> classes;
        private DataTable marksTable;


        public List<Class> Classes
        {
            get
            {
                Subject row = listBox_Subjects.SelectedItem as Subject;
                classes = DataAccessLayer.ClassesBySubject(row.Id);

                return classes;
            }
        }

        public Class CurrentClass
        {
            get
            {
                if (listBox_Classes.Items.Count == 0 || listBox_Classes.SelectedIndex == -1)
                    return null;
                Class classTemp = listBox_Classes.SelectedItem as Class;
                return classTemp;
            }
        }

        public Subject CurrentSubject
        {
            get
            {
                if (listBox_Subjects.Items.Count == 0 || listBox_Subjects.SelectedIndex == -1)
                    return null;
                Subject subjectTemp = listBox_Subjects.SelectedItem as Subject;
                return subjectTemp;
            }
        }
        private Guid CurrentSubjectID
        {
            get
            {
                return ((Subject)this.listBox_Subjects.SelectedItem).Id;
            }
        }

        public DateTime MarkDate
        {
            get
            {
                return new DateTime(dateTimePicker1.Value.Year, dateTimePicker1.Value.Month,
                    this.dataGridView1.CurrentCell.ColumnIndex - 1);
            }
        }

        public Guid CurrentPoepleID
        {
            get
            {
                return DataAccessLayer.GetPeopleID(new People(Guid.Empty,
                    this.dataGridView1.CurrentRow.Cells[0].Value.ToString(),
                    CurrentClass.Id));
            }
        }

        public Journal(Teacher currentTeacher)
        {
            InitializeComponent();

            this.CurrentTeacher = currentTeacher;
            Initialize();
        }

        private void Initialize()
        {
            this.label_userName.Text += CurrentTeacher.Name + "!";
            this.dateTimePicker1.Value = DateTime.Now;

            this.subjects = DataAccessLayer.SubjectsByTeacher(CurrentTeacher.Id);
            this.listBox_Subjects.DisplayMember = "Name";
            this.subjects.Sort(delegate (Subject s1, Subject s2) { return s1.Name.CompareTo(s2.Name); });

            if (this.subjects.Count == 0)
                MessageBox.Show("У вас нет предметов");
            else
                this.listBox_Subjects.DataSource = this.subjects;


            this.listBox_Subjects.SelectedIndexChanged += listBox_Subjects_SelectedIndexChanged;
            this.listBox_Subjects.SelectedIndex = 0;
            listBox_Subjects_SelectedIndexChanged(null, null);

            this.dateTimePicker1.ValueChanged += ValueChange;
            this.listBox_Classes.SelectedIndexChanged += ValueChange;
            this.listBox_Subjects.SelectedIndexChanged += ValueChange;
        }

        private void listBox_Subjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox_Subjects.SelectedIndex == -1)
                return;
            listBox_Classes.DataSource = null;
            listBox_Classes.DisplayMember = "Name";

            if (Classes.Count == 0)
                MessageBox.Show("По этому предмету нет закрепленных классов");
            else
                listBox_Classes.DataSource = Classes;
        }

        private void button_ShowPoints_Click(object sender, EventArgs e)
        {
            ((Button)sender).Enabled = false;
            if (this.CurrentClass != null && this.CurrentSubject != null)
            {
                marksTable = DataAccessLayer.SubjectsClassMarks(CurrentSubject,
                    CurrentClass, dateTimePicker1.Value.Month, dateTimePicker1.Value.Year);
                if (this.marksTable == null)
                {
                    MessageBox.Show("Не удалось получить данные");
                    return;
                }
                this.dataGridView1.DataSource = marksTable;
                SettingsDataGridView();

            }
            else
                MessageBox.Show("Не заданы условия выборки");
        }
        private void SettingsDataGridView()
        {
            if (this.dataGridView1.Rows.Count < 2)
                return;
            this.dataGridView1.BeginEdit(true);
            this.dataGridView1.Columns[0].Frozen = true;
            this.dataGridView1.TopLeftHeaderCell.Value = "№";

            for (int i = 1; i < this.dataGridView1.Columns.Count; i++)
            {
                this.dataGridView1.Columns[i].DefaultCellStyle.BackColor = System.Drawing.Color.White;
                this.dataGridView1.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
                this.dataGridView1.Columns[i].Width = 24;
                this.dataGridView1.Columns[i].Resizable = DataGridViewTriState.False;
            }
            this.dataGridView1.Columns[this.dateTimePicker1.Value.Day].DefaultCellStyle.BackColor = System.Drawing.Color.Chartreuse;
            this.dataGridView1.Columns[DateTime.Today.Day].DefaultCellStyle.BackColor = System.Drawing.Color.Chocolate;


            this.dataGridView1.EndEdit();
            SetMarksColor();
        }
        private void SetMarksColor()
        {
            for (int i = 0; i < this.dataGridView1.Rows.Count; i++)
            {
                for (int j = 1; j < this.dataGridView1.Columns.Count; j++)
                {
                    try
                    {
                        this.dataGridView1[j, i].Style.ForeColor = System.Drawing.Color.Black;
                        if (this.dataGridView1[j, i].Value != null)
                            switch (this.dataGridView1[j, i].Value.ToString())
                            {
                                case "2": this.dataGridView1[j, i].Style.ForeColor = System.Drawing.Color.Red; break;
                                case "3": this.dataGridView1[j, i].Style.ForeColor = System.Drawing.Color.DarkKhaki; break;
                                case "4": this.dataGridView1[j, i].Style.ForeColor = System.Drawing.Color.Blue; break;
                                case "5": this.dataGridView1[j, i].Style.ForeColor = System.Drawing.Color.Green; break;
                                default:
                                    break;
                            }
                    }
                    catch (Exception) { }
                }
            }
        }
        private void ValueChange(object sender, EventArgs e)
        {
            this.button_ShowPoints.Enabled = true;
            this.dataGridView1.DataSource = null;
        }

        private void dataGridView1_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (e.RowIndex == marksTable.Rows.Count)           
                e.Cancel = true;

            if (!String.IsNullOrEmpty(this.dataGridView1[e.ColumnIndex, e.RowIndex].Value.ToString()))
                e.Cancel = true;
        }

        private void dataGridView1_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {            
            this.dataGridView1.EndEdit();
            try { this.marksTable.Rows[e.RowIndex].EndEdit(); }
            catch (Exception) { return; }


            int proposedMark;
            if (!int.TryParse(this.dataGridView1.CurrentCell.Value.ToString(), out proposedMark) ||
                !(proposedMark == 2 || proposedMark == 3 || proposedMark == 4 || proposedMark == 5))
            {
                try
                {
                    dataGridView1.CurrentCell.Value = marksTable.Rows[e.RowIndex][e.ColumnIndex, DataRowVersion.Original];
                }
                catch (Exception)
                {
                    dataGridView1.CurrentCell.Value = null;
                }
                return;
            }
            if (((DataTable)this.dataGridView1.DataSource).Rows[e.RowIndex].RowState == DataRowState.Modified ||
                ((DataTable)this.dataGridView1.DataSource).Rows[e.RowIndex].RowState == DataRowState.Added)
            {
                DataAccessLayer.InsertMark(new Mark(CurrentPoepleID, CurrentSubjectID,
                    Byte.Parse(this.dataGridView1.CurrentCell.Value.ToString()), MarkDate));
            }
            this.marksTable.AcceptChanges();
            SetMarksColor();
        }
    }
}