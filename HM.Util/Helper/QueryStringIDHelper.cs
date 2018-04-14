using System;
using System.Collections.Generic;
using System.Web;

namespace HM.Util
{
  /// <summary>
  /// The query string id helper.
  /// </summary>
  public class QueryStringIDHelper
  {
    /// <summary>
    /// The _id dictionary.
    /// </summary>
    private Dictionary<string, long> _idDictionary = null;

    /// <summary>
    /// Initializes a new instance of the <see cref="QueryStringIDHelper"/> class. 
    /// False to ErrorOnInvalid
    /// </summary>
    /// <param name="idName">
    /// </param>
    public QueryStringIDHelper(string idName)
      : this(idName, false)
    {
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="QueryStringIDHelper"/> class. 
    /// False on ErrorOnInvalid
    /// </summary>
    /// <param name="idNames">
    /// </param>
    public QueryStringIDHelper(string[] idNames)
      : this(idNames, false)
    {
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="QueryStringIDHelper"/> class.
    /// </summary>
    /// <param name="idName">
    /// The id name.
    /// </param>
    /// <param name="errorOnInvalid">
    /// The error on invalid.
    /// </param>
    public QueryStringIDHelper(string idName, bool errorOnInvalid)
    {
      InitIDs(
        new[]
          {
            idName
          }, 
        new[]
          {
            errorOnInvalid
          });
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="QueryStringIDHelper"/> class.
    /// </summary>
    /// <param name="idNames">
    /// The id names.
    /// </param>
    /// <param name="errorOnInvalid">
    /// The error on invalid.
    /// </param>
    public QueryStringIDHelper(string[] idNames, bool errorOnInvalid)
    {
      var failInvalid = new bool[idNames.Length];

      for (int i = 0; i < failInvalid.Length; i++)
      {
        failInvalid[i] = errorOnInvalid;
      }

      InitIDs(idNames, failInvalid);
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="QueryStringIDHelper"/> class.
    /// </summary>
    /// <param name="idNames">
    /// The id names.
    /// </param>
    /// <param name="errorOnInvalid">
    /// The error on invalid.
    /// </param>
    public QueryStringIDHelper(string[] idNames, bool[] errorOnInvalid)
    {
      InitIDs(idNames, errorOnInvalid);
    }

    /// <summary>
    /// Gets Params.
    /// </summary>
    public Dictionary<string, long> Params
    {
      get
      {
        if (this._idDictionary == null)
        {
          this._idDictionary = new Dictionary<string, long>();
        }

        return this._idDictionary;
      }
    }

    /// <summary>
    /// The this.
    /// </summary>
    /// <param name="idName">
    /// The id name.
    /// </param>
    public long? this[string idName]
    {
      get
      {
        if (Params.ContainsKey(idName))
        {
          return Params[idName];
        }

        return null;
      }
    }

    /// <summary>
    /// The contains key.
    /// </summary>
    /// <param name="idName">
    /// The id name.
    /// </param>
    /// <returns>
    /// The contains key.
    /// </returns>
    public bool ContainsKey(string idName)
    {
      return Params.ContainsKey(idName);
    }

    /// <summary>
    /// The init i ds.
    /// </summary>
    /// <param name="idNames">
    /// The id names.
    /// </param>
    /// <param name="errorOnInvalid">
    /// The error on invalid.
    /// </param>
    /// <exception cref="Exception">
    /// </exception>
    private void InitIDs(string[] idNames, bool[] errorOnInvalid)
    {
      if (idNames.Length != errorOnInvalid.Length)
      {
        throw new Exception("idNames and errorOnInvalid variables must be the same array length.");
      }

      for (int i = 0; i < idNames.Length; i++)
      {
        if (!Params.ContainsKey(idNames[i]))
        {
          long idConverted = -1;

          if (!String.IsNullOrEmpty(HttpContext.Current.Request.QueryString[idNames[i]]) &&
              long.TryParse(HttpContext.Current.Request.QueryString[idNames[i]], out idConverted))
          {
            Params.Add(idNames[i], idConverted);
          }
        }
      }
    }
  }
}