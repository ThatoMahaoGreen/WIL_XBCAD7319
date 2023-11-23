using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace WIL
{
    public class DatabaseController
    {
        private static string connString = System.Configuration.ConfigurationManager.ConnectionStrings["AzureDatabase"].ConnectionString;
        public static List<string> emails = new List<string>();
        public static int JobID;
        public static byte[] file;
        public static string contentType;
        

        public static Task<bool> AddNewAdmin(string username, string password)
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("INSERT INTO Administrators VALUES(@username, @password)", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@username", username);
                        sqlCommand.Parameters.AddWithValue("@password", password);
                        await sqlConnection.OpenAsync();
                        int i = await sqlCommand.ExecuteNonQueryAsync();
                        if (i == 1)
                        {             
                          return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }


        public static Task<bool> AddCustomerEmail(string email)
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("INSERT INTO EmailPromotions VALUES(@email)", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@email", email);
                        await sqlConnection.OpenAsync();
                        int i = await sqlCommand.ExecuteNonQueryAsync();
                        if (i == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }

        public static Task<bool> AdminLogin(string username, string password)
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("SELECT * FROM Administrators WHERE AdUsername = @username AND AdPassword = @password", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@username", username);
                        sqlCommand.Parameters.AddWithValue("@password", password);
                        await sqlConnection.OpenAsync();
                        SqlDataReader reader = await sqlCommand.ExecuteReaderAsync();
                        if (await reader.ReadAsync())
                        {
                            
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }

        public static Task<bool> CheckAdminDetails(string username, string password)
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("SELECT * FROM Administrators WHERE AdUsername = @username OR AdPassword = @password", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@username", username);
                        sqlCommand.Parameters.AddWithValue("@password", password);
                        await sqlConnection.OpenAsync();
                        SqlDataReader reader = await sqlCommand.ExecuteReaderAsync();
                        if (await reader.ReadAsync())
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }

        public static Task<bool> AddJobApplication(string name, string email)
        {
           return Task.Run(async () =>
            {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("INSERT INTO JobApplications VALUES(@name, @email)", sqlConnection))
                    {
                        
                        sqlCommand.Parameters.AddWithValue("@name", name);
                        sqlCommand.Parameters.AddWithValue("@email", email);
                        await sqlConnection.OpenAsync();
                        int i = await sqlCommand.ExecuteNonQueryAsync();
                        if (i == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }          
            });
        }

        public static Task<bool> AddCV(string fileName, string contentType, Stream Data)
        {
            return Task.Run(async () =>
            {
                using (BinaryReader br = new BinaryReader(Data)) 
                {
                    byte[] bytes = br.ReadBytes((int)Data.Length);
                    using (var sqlConnection = new SqlConnection(connString))
                    {
                        using (var sqlCommand = new SqlCommand("INSERT INTO CV_Files VALUES(@id, @name, @contenttype, @data)", sqlConnection))
                        {
                            sqlCommand.Parameters.AddWithValue("@id", JobID);
                            sqlCommand.Parameters.AddWithValue("@name", fileName);
                            sqlCommand.Parameters.AddWithValue("@contenttype", contentType);
                            sqlCommand.Parameters.AddWithValue("@data", bytes);
                            await sqlConnection.OpenAsync();
                            int i = await sqlCommand.ExecuteNonQueryAsync();
                            if (i == 1)
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                    }
                }
            });
        }
        public static Task<bool> GetApplicationID(string name, string email)
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("SELECT * FROM JobApplications WHERE Name = @name AND Email = @email", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@name", name);
                        sqlCommand.Parameters.AddWithValue("@email", email);
                        await sqlConnection.OpenAsync();
                        SqlDataReader reader = await sqlCommand.ExecuteReaderAsync();
                        if (await reader.ReadAsync())
                        {
                            JobID = (int) reader["Application_ID"];
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }

        public static Task<bool> GetFile()
        {
            return Task.Run(async () => {
                using (var sqlConnection = new SqlConnection(connString))
                {
                    using (var sqlCommand = new SqlCommand("SELECT Data and Content_Type FROM CV_Files WHERE JobID = @id", sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@id", JobID);
                        await sqlConnection.OpenAsync();
                        SqlDataReader reader = await sqlCommand.ExecuteReaderAsync();
                        if (await reader.ReadAsync())
                        {
                            file = (byte[])reader["Data"];
                            contentType = reader["Content_Type"].ToString();
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            });
        }
    }
}