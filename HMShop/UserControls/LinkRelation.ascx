<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LinkRelation.ascx.cs" 
    Inherits="HMShop.UserControls.LinkRelation" %>

<div style="border: 1px solid rgb(238, 238, 238);" cellpadding="2" cellspacing="0" width="100%">
    <select name="choice" style="width: 100%;" onchange="Change(this)">
        <%--<option value="0" selected="selected">Liên kết Websites</option>--%>
        <option value="https://www.adayroi.com/">A đây rồi</option>
        <option value="https://www.thegioididong.com/">Thế giới di động</option>
        <option value="https://www.zalora.vn">Zalora</option>
        <option value="https://www.chodientu.vn/">Chợ điện tử</option>
        <option value="https://www.dienmayxanh.com/">Điện máy xanh</option>
        <option value="http://www.123mua.vn/">123 Mua</option>
        <option value="https://www.5giay.vn/">5 Giây</option>
        <option value="https://tiki.vn/">Tiki</option>
        <option value="http://www.webmuaban.vn/">Web mua bán</option>
        <option value="http://www.golmart.vn/">Gold mart</option>
        <option value="http://www.ebay.vn/">Ebay VN</option>
        <option value="https://www.vinabook.com/">Vina book</option>
        <option value="https://travel.com.vn/">Viêt Travel</option>
        <option value="http://raonhanh.com/">Rao nhanh</option>
        <option value="http://www.vatgia.com/">Vật giá</option>
        <option value="http://www.raovat.com/">Rao vặt</option>
        <option value="http://chodocu.com/">Chợ đồ cũ</option>
        <option value="https://www.chotot.com/">Chợ tốt</option>
        <option value="https://juno.vn">Juno</option>
        <option value="https://www.sendo.vn">Sen đỏ</option>
        <option value="http://zanado.com/">Zanado</option>
        <option value="http://www.lazada.vn/">Lazada</option>
        <option value="http://www.nguyenkim.com/">Nguyễn Kim</option>
        <option value="https://mymall.vn">My Mall</option>
        <option value="https://vienthonga.vn">Viễn thông A</option>
        <option value="hhttps://hc.com.vn/">Điện máy HC</option>
    </select>

    <script type="text/javascript">
        function Change(selected) {
            //if (this.options[selected].value != 0) {
            //    window.open(this.options[selected].value)
            //}
            if (selected.value != 0) {
                window.open(selected.value)
            }
        }
        function Links() {
            var link = link.value;
            window.open(link);
        }
    </script>
</div>