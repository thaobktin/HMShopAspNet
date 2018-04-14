<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarketInfo.ascx.cs" Inherits="HMShop.UserControls.MarketInfo" %>

<script type="text/javascript">
    function showWeather() {
        window.open('http://hn.24h.com.vn/ttcb/thoitiet/thoitiet.php', 'new_window', 'scrollbars=no, resizable=no, width=900, height=900');
    }
    function showStock() {
        window.open('http://chungkhoan.24h.com.vn/', 'new_window', 'scrollbars=yes, resizable=no, width=900, height=900');
    }
    function showGoldPrice() {
        window.open('http://hcm.24h.com.vn/ttcb/giavang/giavang.php', 'new_window', 'scrollbars=no, resizable=no, width=900, height=900');
    }
    function showMoneyRate() {
        window.open('http://hn.24h.com.vn/ttcb/tygia/tygia.php', 'new_window', 'scrollbars=no, resizable=no, width=900 height=900');
    }
    function showBigInfo() {
        window.open('http://ketquaxoso.24h.com.vn', 'new_window', 'scrollbars=yes, resizable=no, width=900, height=900');
    }
</script>

<table style="border: 1px solid rgb(238, 238, 238);" cellpadding="2" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td align="center" style="height: 23px">
                <img alt="Dollar" src="<%= Page.ResolveClientUrl("~/assets/images/market/icon_dollar.gif") %>" width="9" height="15" />
            </td>
            <td style="height: 23px">
                <a href="javascript:showMoneyRate();" title="Tỉ giá ngoại tệ">Tỉ giá ngoại tệ</a>
            </td>
        </tr>
        <tr>
            <td align="center">
                <img alt="Gold" src="<%= Page.ResolveClientUrl("~/assets/images/market/icon_gold.gif") %>" width="9" height="15" />
            </td>
            <td>
                <a href="javascript:showGoldPrice();" title="Giá vàng">Giá vàng</a>
            </td>
        </tr>
        <tr>
            <td align="center">
                <img alt="Lottery" src="<%= Page.ResolveClientUrl("~/assets/images/market/icon_loto.gif") %>" width="9" height="15" />
            </td>
            <td>
                <a href="javascript:showBigInfo('kqxs')" title="Kết quả xổ số kiến thiết">KQ xổ số kiến thiết</a>
            </td>
        </tr>
        <tr>
            <td align="center">
                <img alt="Securities" src="<%= Page.ResolveClientUrl("~/assets/images/market/icon_stock.gif") %>" width="9" height="15" />
            </td>
            <td>
                <a href="javascript:showStock();" title="Chứng khoán">Chứng khoán</a>
            </td>
        </tr>
        <tr>
            <td align="center" style="height: 23px">
                <img alt="Weather" src=" <%= Page.ResolveClientUrl("~/assets/images/market/icon_weather.png") %>" width="9" height="15" />
            </td>
            <td style="height: 23px">
                <a href="javascript:showWeather();" title="Thời tiết">Thời Tiết</a>
            </td>
        </tr>
    </tbody>
</table>