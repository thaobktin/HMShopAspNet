using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface ILanguageAdapter
    {
        string Insert(LanguageInfo entity);
        bool Update(LanguageInfo entity);
        bool Delete(string langId);
        LanguageInfo GetById(string langId);
        List<LanguageInfo> GetAll();
    }
}
