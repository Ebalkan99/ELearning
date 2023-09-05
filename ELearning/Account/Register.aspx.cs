using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ELearning.Models;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Generic;
using Scrypt;



namespace ELearning.Account
{
    public static class Hashing
    {
        public static string ToSHA256(string password)
        {
            var sha256 = SHA256.Create();
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            var sb = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                sb.Append(bytes[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("enter string to hash:");
            string input = Console.ReadLine();
            Console.WriteLine($"hashed string:{Hashing.ToSHA256(input)}");

            Console.WriteLine();
        }
    }
    public partial class Register : Page
    {

        public class HashingHelper
        {
            public static void CreatePasswordHash(String Password, out byte[] passwordHash, out byte[] passwordSalt)
            {
                using (var hmac = new System.Security.Cryptography.HMACSHA512())//burdan yararlanarak bir password ve salt olusturacagiz

                {
                    passwordSalt = hmac.Key;
                    passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(Password));


                }
            }
            public static bool VerifyPasswordHash(String Password, byte[] passwordHash, byte[] passwordSalt)
            {
                using (var hmac = new System.Security.Cryptography.HMACSHA512(passwordSalt))
                {
                    var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(Password));
                    for (int i = 0; i < computedHash.Length; i++)
                    {
                        if (computedHash[i] != passwordHash[i])
                        {
                            return false;

                        }

                    }
                    return true;
                }


            }

        }


        ScryptEncoder encoder = new ScryptEncoder();
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (RadInstructor.Checked == true)
            {
                App_Start.ELearningDataSetTableAdapters.hashingTableAdapter hashs = new App_Start.ELearningDataSetTableAdapters.hashingTableAdapter();
                App_Start.ELearningDataSetTableAdapters.tbl_InstructorsTableAdapter instructor = new App_Start.ELearningDataSetTableAdapters.tbl_InstructorsTableAdapter();
                Membership.CreateUser(Email.Text, Password.Text);

                Roles.AddUserToRole(Email.Text, "Instructors");
                hashs.Insert(Email.Text, encoder.Encode(Password.Text));
                instructor.Insert(Email.Text, Password.Text);

                Response.Redirect("~/Default.aspx");
            }
            else if (RadStudent.Checked == true)
            {
                App_Start.ELearningDataSetTableAdapters.hashingTableAdapter hashs = new App_Start.ELearningDataSetTableAdapters.hashingTableAdapter();

                App_Start.ELearningDataSetTableAdapters.tbl_StudentsTableAdapter student = new App_Start.ELearningDataSetTableAdapters.tbl_StudentsTableAdapter();
                hashs.Insert(Email.Text, encoder.Encode(Password.Text));

                Membership.CreateUser(Email.Text, Password.Text);
                Roles.AddUserToRole(Email.Text, "Students");
                student.Insert(Email.Text, Password.Text);
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}