using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainUserAdapter
    {
        string Insert(MainUserInfo entity);
        bool Update(MainUserInfo entity);
        bool Delete(string id);
        MainUserInfo GetById(string id);
        List<MainUserInfo> GetAll();
        MainUserInfo GetByEmail(string email);
        MainUserInfo GetByEmailPassword(string email, string password);
    }
}
