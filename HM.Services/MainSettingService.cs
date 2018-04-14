using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class MainSettingService
    {
        private readonly IMainSettingAdapter _mainSettingAdapter;

        public MainSettingService()
        {
            _mainSettingAdapter = new MainSettingDataAdapter();
        }

        public string SetValue (string name, string value)
        {
            return _mainSettingAdapter.SetValue(name, value);
        }

        public string GetValue(string name)
        {
            return _mainSettingAdapter.GetValue(name);
        }

        public bool Delete(string id)
        {
            return _mainSettingAdapter.Delete(id);
        }

        public bool DeleteByName(string name)
        {
            return _mainSettingAdapter.DeleteByName(name);
        }
    }
}
