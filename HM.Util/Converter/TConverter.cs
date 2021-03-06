﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HM.Util
{
    public sealed class Converter<TFrom, TTo> : Converter
    {
        private readonly Func<object, object> _Converter;

        public Converter(Func<TFrom, TTo> converter)
            : base(typeof(TFrom).GUID, typeof(TTo).GUID)
        {
            _Converter = o =>
            {
                if (!(o is TFrom))
                {
                    throw new ArgumentException();
                }

                return converter.Invoke((TFrom)o);
            };
        }

        public override object Convert(object obj)
        {
            return _Converter.Invoke(obj);
        }
    }
}
