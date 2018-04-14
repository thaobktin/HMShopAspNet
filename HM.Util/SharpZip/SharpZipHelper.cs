using System;
using System.Collections.Generic;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using System.Text;
using System.Reflection;

namespace HM.Util
{
    /// <summary>
    /// Tao file 
    /// Phan nay lay ben project cua huongtn
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// TRAN QUANG TRUNG  11/4/2013   created
    /// </Modified>
    public class SharpZipHelper
    {
        /// <summary>
        /// mở file zip
        /// </summary>
        /// <param name="fileZip">tên file zip</param>
        /// <param name="index">vị trí file txt trong file zip</param>
        /// <param name="length">số byte của file txt đó</param>
        /// <param name="passWords">mật khẩu để mở file zip</param>
        /// <returns></returns>
        public static string ExtractZipFile(string fileZipName, int index, int length, string password)
        {
            // mảng chứa các 
            byte[] retArray = new byte[length];
            ZipFile zf = null;
            try
            {
                // mở file zip
                FileStream fs = File.OpenRead(fileZipName);
                zf = new ZipFile(fs);
                if (!String.IsNullOrEmpty(password))
                {
                    zf.Password = password;     // AES encrypted entries are handled automatically
                }
                ZipEntry zipEntry = zf[index];
                if (!zipEntry.IsFile)
                {
                    return string.Empty;
                }
                String entryFileName = zipEntry.Name;
                MemoryStream ms = new MemoryStream();
                zf.GetInputStream(zipEntry).CopyTo(ms);
                retArray = ms.ToArray();
            }
            finally
            {
                if (zf != null)
                {
                    zf.IsStreamOwner = true; // Makes close also shut the underlying stream
                    zf.Close(); // Ensure we release resources
                }
            }
            return System.Text.ASCIIEncoding.ASCII.GetString(retArray);

        }

        /// <summary>
        /// Zip các file txt từ thư mục đầu vào
        /// </summary>
        /// <param name="folderIn">thư mục chứa các file txt</param>
        /// <param name="strPassWord">mật khẩu</param>
        /// <returns></returns>
        public static bool MakeZipFile(string folderNameInput, string folderNameOutput, string fileZipName, string fileIndex, string password)
        {
            fileZipName = Path.Combine(folderNameOutput, fileZipName);
            fileIndex = Path.Combine(folderNameOutput, fileIndex);

            // vị trí các file biển số trong file Zip
            int index = 0;

            // kiểm tra file index : nêu tồn tại => xóa để zip lại
            if (File.Exists(fileIndex)) File.Delete(fileIndex);

            StringBuilder sb = new StringBuilder();
            //số byte của file biển số s

            //stream để ghi file index
            StreamWriter swIndex = null;

            long length = 0;
            // giá trị trả về
            // true nếu thành công
            bool returnvalue = true;
            try
            {
                using (ZipOutputStream zipStream = new ZipOutputStream(File.Create(fileZipName)))
                {
                    // cài passwords
                    zipStream.Password = password;

                    // cài đặt mức an toàn
                    zipStream.SetLevel(9); // 0 - store only to 9 - means best compression

                    // biển số trong file
                    string VehiclePlate = string.Empty;

                    // chứa nội dung
                    byte[] buffer = new byte[4096];
                    // lưu trữ các file trong thư mục cần zip
                    string[] filePaths = Directory.GetFiles(folderNameInput, "*.txt");

                    if (filePaths != null && filePaths.Length > 0)
                    {
                        // duyệt từng file
                        foreach (string file in filePaths)
                        {
                            // lấy độ dài file
                            length = new FileInfo(file).Length;
                            // biển số xe
                            VehiclePlate = Path.GetFileNameWithoutExtension(file);
                            // tạo Zipentry từ file
                            ZipEntry entry = new ZipEntry(Path.GetFileName(file));
                            // đẩy entry đó vào zip stream
                            zipStream.PutNextEntry(entry);
                            // đọc dữ liệu từ file biển số ra zipFile
                            using (FileStream fs = File.OpenRead(file))
                            {
                                int sourceBytes;
                                do
                                {
                                    sourceBytes = fs.Read(buffer, 0, buffer.Length);
                                    zipStream.Write(buffer, 0, sourceBytes);
                                } while (sourceBytes > 0);
                            }

                            // ghi file index
                            sb.Append(String.Format("{0},{1},{2} \r\n", VehiclePlate, index.ToString(), length.ToString()));

                            // tăng chỉ số file biển số
                            index++;
                        }

                        //stream để ghi file index
                        swIndex = new StreamWriter(fileIndex, true);

                        //Write noi dung file index
                        swIndex.Write(sb);
                    }

                    swIndex.Close();
                    zipStream.Finish();
                    zipStream.Close();
                }
                returnvalue = true;
            }
            catch (Exception)
            {
                returnvalue = false;
            }
            return returnvalue;
        }

        /// <summary>
        /// lấy vị trí của file biển số trong file zip
        /// </summary>
        /// <param name="vehiclePlate">biển số xe</param>
        /// <param name="fileIndex">tên file index</param>
        /// <param name="length">số byte của file biển số</param>
        /// <returns></returns>
        public static void GetVehicleIndex(string vehiclePlate, string fileIndexName, out int index, out int length)
        {
            length = 0;
            index = -1;
            if (!File.Exists(fileIndexName))
            {
                return;
            }
            string[] vehiclePlateFields;
            StreamReader stReader = new StreamReader(fileIndexName);
            while (!stReader.EndOfStream)
            {
                vehiclePlateFields = stReader.ReadLine().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                //So sanh bien so 
                if (vehiclePlateFields[0].Equals(vehiclePlate, StringComparison.InvariantCultureIgnoreCase))
                {
                    index = Int32.Parse(vehiclePlateFields[1]);
                    length = Int32.Parse(vehiclePlateFields[2]);
                }
            }
        }
    }
}
