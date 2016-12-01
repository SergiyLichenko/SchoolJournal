using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using SchoolJournal.Common;

namespace SchoolJournal.DAL
{
    public static class DataAccessLayer
    {

        private static string connectionString = Properties.Settings.Default.ConnectionString;
        private static SqlConnection connection;
        private static SqlDataAdapter teacherAdapter;
        private static SqlDataAdapter classesBySubjectAdapter;
        private static SqlDataAdapter marksAdapter;
        private static SqlDataAdapter allPeopleInClass;
        private static DataTable allTeachers;
        private static SqlCommand teacherCommand;
        private static SqlCommand insertCommand;
        private static SqlCommand selectPeopleID;

        private static SqlConnection Connection
        {
            get
            {
                if (DataAccessLayer.connection == null)
                    DataAccessLayer.connection = new SqlConnection(DataAccessLayer.connectionString);
                return DataAccessLayer.connection;
            }
        }
        private static SqlDataAdapter TeacherAdapter
        {
            get
            {
                if (DataAccessLayer.teacherAdapter == null)
                {
                    SqlCommand command = Connection.CreateCommand();
                    command.CommandText = "Select * from Teachers;";
                    DataAccessLayer.teacherAdapter = new SqlDataAdapter(command);
                }
                return DataAccessLayer.teacherAdapter;
            }
        }
        public static DataTable AllTeachers
        {
            get
            {
                if (allTeachers == null || allTeachers.Rows.Count == 0)
                {
                    allTeachers = new DataTable("Teachers");
                    try { DataAccessLayer.TeacherAdapter.Fill(allTeachers); }
                    catch (Exception) { }
                }
                return DataAccessLayer.allTeachers;
            }
        }


        private static SqlCommand TeacherCommand
        {
            get
            {
                if (teacherCommand == null)
                {
                    teacherCommand = Connection.CreateCommand();
                    teacherCommand.CommandText = "GetTeacherSubjects";
                    teacherCommand.CommandType = CommandType.StoredProcedure;
                }
                return teacherCommand;
            }
        }

        public static SqlDataAdapter ClassesBySubjectAdapter
        {
            get
            {
                if (classesBySubjectAdapter == null)
                {
                    classesBySubjectAdapter = new SqlDataAdapter();
                    SqlCommand selectCommand = Connection.CreateCommand();
                    selectCommand.CommandText = "GetClassesBySubject";
                    selectCommand.CommandType = CommandType.StoredProcedure;
                    selectCommand.Parameters.Add("@SubjectID", SqlDbType.UniqueIdentifier);

                    classesBySubjectAdapter.SelectCommand = selectCommand;
                }
                return classesBySubjectAdapter;
            }

        }

        public static SqlDataAdapter MarksAdapter
        {
            get
            {
                if (marksAdapter == null)
                {
                    marksAdapter = new SqlDataAdapter();
                    marksAdapter.SelectCommand = new SqlCommand();
                    marksAdapter.SelectCommand.Connection = Connection;
                    marksAdapter.SelectCommand.CommandText = "GetMarks";
                    marksAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    marksAdapter.SelectCommand.Parameters.Add("@className", SqlDbType.NVarChar);
                    marksAdapter.SelectCommand.Parameters.Add("@subjectName", SqlDbType.NVarChar);
                }
                return marksAdapter;
            }

        }

        public static SqlDataAdapter AllPeopleInClass
        {
            get
            {
                if (allPeopleInClass == null)
                {
                    allPeopleInClass = new SqlDataAdapter();
                    allPeopleInClass.SelectCommand = new SqlCommand();
                    allPeopleInClass.SelectCommand.CommandText = "AllPeopleInClass";
                    allPeopleInClass.SelectCommand.CommandType = CommandType.StoredProcedure;
                    allPeopleInClass.SelectCommand.Connection = Connection;
                    allPeopleInClass.SelectCommand.Parameters.Add("@className", SqlDbType.NVarChar);
                }
                return allPeopleInClass;
            }
        }

        private static SqlCommand InsertCommand
        {
            get
            {
                if (insertCommand == null)
                {
                    insertCommand = new SqlCommand();
                    insertCommand.CommandText = "Insert into dbo.Marks ([PeopleID], [SubjectID], [DateMark], [Mark]) values " +
                        "(@PeopleID, @SubjectID, @DateMark, @Mark);";
                    insertCommand.CommandType = CommandType.Text;
                    insertCommand.Connection = Connection;

                    insertCommand.Parameters.Add("@PeopleID", SqlDbType.UniqueIdentifier);
                    insertCommand.Parameters.Add("@SubjectID", SqlDbType.UniqueIdentifier);
                    insertCommand.Parameters.Add("@DateMark", SqlDbType.DateTime);
                    insertCommand.Parameters.Add("@Mark", SqlDbType.TinyInt);
                }
                return insertCommand;
            }
        }

        public static SqlCommand SelectPeopleID
        {
            get
            {
                if (selectPeopleID == null)
                {
                    selectPeopleID = new SqlCommand();
                    selectPeopleID.CommandText = "SelectPeopleID";
                    selectPeopleID.CommandType = CommandType.StoredProcedure;
                    selectPeopleID.Connection = Connection;

                    selectPeopleID.Parameters.Add("@ClassID", SqlDbType.UniqueIdentifier);
                    selectPeopleID.Parameters.Add("@Name", SqlDbType.NVarChar);
                }
                return selectPeopleID;
            }

        }

        public static List<Subject> SubjectsByTeacher(Guid teacherID)
        {
            List<Subject> subjects = new List<Subject>();
            TeacherCommand.Parameters.Clear();
            TeacherCommand.Parameters.AddWithValue("@TeacherID", teacherID);
            try
            {
                Connection.Open();
                SqlDataReader reader = TeacherCommand.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.HasRows)
                    while (reader.Read())
                        subjects.Add(new Subject(new Guid(reader["ID"].ToString()),
                            reader["Name"].ToString(), new Guid(reader["TeacherID"].ToString())));
            }
            catch { }

            Connection.Close();
            return subjects;
        }

        public static List<Class> ClassesBySubject(Guid subjectID)
        {
            ClassesBySubjectAdapter.SelectCommand.Parameters["@SubjectID"].Value = subjectID;
            List<Class> classesList = new List<Class>();
            try
            {
                DataTable classes = new DataTable("Classes");
                ClassesBySubjectAdapter.Fill(classes);

                foreach (DataRow item in classes.Rows)
                    classesList.Add(new Class(new Guid(item["ID"].ToString()), item["Name"].ToString()));
            }
            catch (Exception) { }

            return classesList;
        }

        public static DataTable SubjectsClassMarks(Subject subject, Class clasS, int month, int year)
        {
            MarksAdapter.SelectCommand.Parameters["@subjectName"].Value = subject.Name;
            MarksAdapter.SelectCommand.Parameters["@className"].Value = clasS.Name;

            DataTable peoples = new DataTable("Peoples");
            AllPeopleInClass.SelectCommand.Parameters["@className"].Value = clasS.Name;
            AllPeopleInClass.Fill(peoples);

            DataTable marks = new DataTable("Temp");
            MarksAdapter.Fill(marks);
            return MergeTables(peoples, marks, subject, month, year);

        }
        private static DataTable MergeTables(DataTable peoples, DataTable marks, Subject subject, int month, int year)
        {
            DataTable result = new DataTable();
            result.Columns.Add(new DataColumn(subject.Name));
            for (int i = 1; i < 32; i++)
                result.Columns.Add(new DataColumn(i.ToString()));

            foreach (DataRow item in peoples.Rows)
            {
                DataRow tempRow = result.NewRow();
                tempRow[subject.Name] = item["Name"];
                foreach (DataRow item2 in marks.Select(String.Format("PeopleID = '{0}'", item["ID"])))
                {
                    string date = item2["DateMark"].ToString();
                    int monthTemp = Convert.ToInt32(date.Substring(date.IndexOf('.') + 1, 2));
                    int yearTemp = Convert.ToInt32(date.Substring(date.IndexOf('.') + 4, 4));
                    if (yearTemp != year || monthTemp != month)
                        continue;
                    int day = Convert.ToInt32(date.Substring(0, date.IndexOf('.')));
                    tempRow[day + 1] = item2["Mark"];
                }
                result.Rows.Add(tempRow);
            }
            return result;
        }

        public static bool InsertMark(Mark mark)
        {
            InsertCommand.Parameters["@PeopleID"].Value = mark.PeopleId;
            InsertCommand.Parameters["@SubjectID"].Value = mark.SubjectId;
            InsertCommand.Parameters["@DateMark"].Value = mark.DateMark;
            InsertCommand.Parameters["@Mark"].Value = mark.Value;

            int result = 0;
            try
            {
                Connection.Open();
                result = InsertCommand.ExecuteNonQuery();
            }
            catch (Exception) { return false; }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
            }

            if (result > 0)
                return true;
            return false;
        }

        public static Guid GetPeopleID(People people)
        {
            SelectPeopleID.Parameters["@ClassID"].Value = people.ClassId;
            SelectPeopleID.Parameters["@Name"].Value = people.Name;
            try
            {
                Connection.Open();
                object o = SelectPeopleID.ExecuteScalar();
                if (o != null)
                    return new Guid(o.ToString());               
            }
            catch (Exception)
            {
                return Guid.Empty;
            }
            finally
            {
                Connection.Close();
            }

            return Guid.Empty;
        }
    }
}
