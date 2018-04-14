using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainSettingAdapter
    {
        string SetValue(string name, string value);
        string GetValue(string name);
        bool Delete(string id);
        bool DeleteByName(string name);
    }
}
