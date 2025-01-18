using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;

namespace GiaPha
{
    public class Common
    {
        private static string serverRootFolderPath = System.Web.HttpContext.Current.Server.MapPath("~/");
        //private string serverRootFolderPath = System.Web.Hosting.HostingEnvironment.MapPath("~/");

        public static string XuLyTenFile(HttpPostedFileBase file)
        {
            var fileName = file.FileName;
            if (fileName.Contains("\\"))
            {
                fileName = fileName.Replace("\\", "|");
                fileName = fileName.Split('|')[fileName.Split('|').Length - 1];
            }

            return fileName;
        }

        public static string LuuFile(HttpPostedFileBase file, string fileName, string folderPath, bool ghiDe = false)
        {
            folderPath = $"{serverRootFolderPath}\\{folderPath}\\";
            string filePath = $"{folderPath}\\{fileName}";
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            if (File.Exists(filePath))
            {
                if (!ghiDe) throw new Exception("File cùng tên đã tồn tại!");
                File.Delete(filePath);
            }
            file.SaveAs(filePath);
            return filePath;
        }

        public static string XoaFile(string filePath)
        {
            filePath = $"{serverRootFolderPath}\\{filePath}";
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
            return filePath;
        }

        public static void CopyTatCaFileToiThuMucMoi(string folderPathOld, string folderPathNew, bool ghiDe = false)
        {
            folderPathNew = $"{serverRootFolderPath}\\{folderPathOld}";
            folderPathNew = $"{serverRootFolderPath}\\{folderPathNew}";
            if (Directory.Exists(folderPathOld))
            {
                string[] files = System.IO.Directory.GetFiles(folderPathOld);
                // Copy the files and overwrite (ghiDe = true) destination files if they already exist.
                foreach (string file in files)
                {
                    // Use static Path methods to extract only the file name from the path.
                    var fileName = Path.GetFileName(file);
                    var filePathNew = Path.Combine(folderPathNew, fileName);
                    if (File.Exists(filePathNew))
                    {
                        if (!ghiDe) throw new Exception(string.Format("File {0} đã tồn tại!", fileName));
                        File.Delete(filePathNew);
                    }
                    File.Copy(file, filePathNew, ghiDe);
                }
            }
        }

        public static void CopyFile(string sourcePath, string destinationPath)
        {
            sourcePath = $"{serverRootFolderPath}\\{sourcePath}";
            destinationPath = $"{serverRootFolderPath}\\{destinationPath}";
            if (File.Exists(sourcePath))
            {
                File.Copy(sourcePath, destinationPath, true);
            }
            else
            {
                throw new FileNotFoundException("Không tìm thấy file đã yêu cầu trên máy chủ!");
            }
        }

        public static string OpenFile(string path)
        {
            string fileName = Path.GetFileName(path);
            string destPath = "/Files/Open/" + fileName;
            CopyFile(serverRootFolderPath + "\\" + path, serverRootFolderPath + "\\" + destPath);
            return destPath;
        }
    }
}