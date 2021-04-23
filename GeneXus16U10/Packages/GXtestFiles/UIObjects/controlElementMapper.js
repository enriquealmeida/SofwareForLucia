gx.forminspector = function (controlName, rowNumber, webComponentName) {
    var rowString = rowNumber ? gx.text.padl(rowNumber.toString(), 4, "0") : undefined,
        r = '[data-gx-control-name="' + controlName.toLowerCase() + '"]',
        f, u;
    return rowNumber && (r = '[data-gxrow="' + rowString + '"] ' + r),
        f = gx.$(r), u = webComponentName ?
            gx.pO.WebComponents.filter(function (n) {
                return n.ServerClass === webComponentName.toLowerCase();
            }) : [], ret = gx.$.map(f,
                function (n) {
                    var t = gx.$(n).closest("[class=gxwebcomponent]").map(function () {
                        var t = function (n) {
                            return n.replace(/^gxHTMLWrp/, "");
                        },
                            i = this.id,
                            n;
                        if (u.length > 0) {
                            if (n = u.filter(function (n) {
                                return i.endsWith(n.CmpContext);
                            }),
                                n.length > 0)
                                return t(n[0].CmpContext);
                        } else
                            return t(i);
                    }).get().join(),
                        r = n.id.endsWith("_MPAGE");
                    if (!webComponentName || t.length > 0)
                        return [{
                            inMasterPage: r,
                            cmp: t || "",
                            id: n.id,
                            value: n.value || n.textContent
                        }];
                });
};