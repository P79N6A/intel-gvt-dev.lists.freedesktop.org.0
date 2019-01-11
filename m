Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2756921ywd;
        Fri, 11 Jan 2019 01:34:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6WLIMZue7j7EQQktt8muG3e0ZaDVmdcy2IWWdkHfhUpiqfUNbjd+VNvgc67iGUeqesyFdS
X-Received: by 2002:a63:5b48:: with SMTP id l8mr12723086pgm.80.1547199259879;
        Fri, 11 Jan 2019 01:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199259; cv=none;
        d=google.com; s=arc-20160816;
        b=SvpNV/21wiHTXRGA3iYPvpp0DbOETvXE0s+CBYcldQR8YirL7L+NPS9HBIwgP6ASo4
         Tn5MIMmKdySjU/JbwqamSSzP4f1UBn+fBOKM10nhSKwF06AzpwuZrCx/UJJrEOONKM6R
         nQ36ko/6kj6Nhi3SYsh1Z9XHtQNHBxRd9eBVt39YrGjw7iHb0stmuL8KHU4hukrkeT32
         nEedFPI7FjA5uL7+Jwu+ATShGj+E489gk5tQpoZMfUuJQgDSS/YXZ6WnneRDt8p28RkI
         JtFW+yhaeYu5EmN+vMYaw14Bkp14qKXY53EbDv4QqUUjH+dnMXNVmlkdT50vO3BUdeuO
         55Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=Jo/69eYuQrPl53kvIjRPrF8s1ykjtA7rSO0Pvs3agH4=;
        b=nFa3/Vj4VD0sqpVh7iz07sEGByI7y1+gNzFOFG+gSxfDAlCD6js6yfTlzQKkWhj2Ok
         Ivl62+enkUiFIuZImHwydkZfX4eyIqoxitp8SWA3c8Sz+IqkVAUC6WfGJzClTIAJjiSw
         k8aL908OZ3yb0xGIdota19I2m8r8JqItC6N2X0y6dU80F4aexfEJq1A6fwrM+bFvRFmm
         2sAxEdbJiRkZ+o0DU/zam7L+UdRmDIlKxu29S+HmMfs2I+p2rUhVfvERo4S/stAJ1F5t
         8XmoFH+m+nyhfBe65NuiDLXRXQdG+WAAhEYkcWlCkHCfvYxl9PDxc4EIseaaVyU+a1Ez
         7o8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x6si19118634pgh.363.2019.01.11.01.34.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:34:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E36E70A;
	Fri, 11 Jan 2019 09:34:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DBA6E70A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:34:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2019 01:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,465,1539673200"; 
 d="log'?scan'208";a="125226083"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga002.jf.intel.com with ESMTP; 11 Jan 2019 01:34:17 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 11 Jan 2019 01:34:17 -0800
Received: from [127.0.1.1] (10.239.48.36) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 11 Jan
 2019 17:34:15 +0800
Content-Type: multipart/mixed; boundary="===============2704570883368031582=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch [PATCH_1/5]_vfio:_update_kernel_headers.
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190111093116.17188-2-kraxel@redhat.com>
Message-ID: <51b42d3c-2968-4d68-829e-3661d14ce9a2@shsmsx104.ccr.corp.intel.com>
Date: Fri, 11 Jan 2019 17:34:15 +0800
X-Originating-IP: [10.239.48.36]
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2704570883368031582==
Content-Type: text/html; charset="uft-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

CiAgICAgICAgICAgICAgICA8dGFibGUgY29sb3I9IkNDQ0MzMyIgd2lkdGg9IjgwMCIgYm9yZGVy
PSIxIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjUiIHRleHQtYWxpZ249ImNlbnRlciI+
CiAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5
bGU9IndvcmQtd3JhcDpicmVhay13b3JkO3dvcmQtYnJlYWs6YnJlYWstYWxsOyIgd2lkdGg9IjEw
MHB4IiB0ZXh0LWFsaWduPSJjZW50ZXIiIGJnY29sb3I9ImxpZ2h0Ymx1ZSI+U3ViamVjdDo8L3Rk
PgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249
ImNlbnRlciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Pd25lcjo8L3RkPgogICAgICAgICAgICAgICAg
ICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRlciIgYmdjb2xvcj0i
bGlnaHRibHVlIj48Zm9udCBjb2xvcj0ncmVkJz5FcnJvciBUeXBlOjwvZm9udD48L3RkPgogICAg
ICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRl
ciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Mb2c6PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3Ry
PgogICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHRl
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXzEvNV1fdmZpbzpfdXBkYXRlX2tlcm5lbF9oZWFkZXJz
LiA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+a3JheGVsIDwvdGQ+CiAgICAgICAg
ICAgICAgICAgICAgICAgIDx0ZD5idWlsZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAg
ICAgICAgIDx0ZD5idWlsZCA8YSBocmVmPSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29t
OjgwODAvam9iL3BhdGNoLXRlc3Qta3ZtZ3QvMzM4L2NvbnNvbGUiPjMzODwvYT48L3RkPgogICAg
ICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============2704570883368031582==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDMzOAogIENMRUFOICAgLgogIENM
RUFOICAgYXJjaC94ODYvZW50cnkvdmRzbwogIENMRUFOICAgYXJjaC94ODYva2VybmVsL2NwdQog
IENMRUFOICAgYXJjaC94ODYva2VybmVsCiAgQ0xFQU4gICBhcmNoL3g4Ni9wdXJnYXRvcnkKICBD
TEVBTiAgIGFyY2gveDg2L3JlYWxtb2RlL3JtCiAgQ0xFQU4gICBhcmNoL3g4Ni9saWIKICBDTEVB
TiAgIGNlcnRzCiAgQ0xFQU4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViCiAgQ0xFQU4g
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uCiAgQ0xFQU4gICBkcml2ZXJzL25ldC93YW4KICBDTEVB
TiAgIGRyaXZlcnMvc2NzaS9haWM3eHh4CiAgQ0xFQU4gICBkcml2ZXJzL3Njc2kKICBDTEVBTiAg
IGRyaXZlcnMvdHR5L3Z0CiAgQ0xFQU4gICBrZXJuZWwvZGVidWcva2RiCiAgQ0xFQU4gICBsaWIv
cmFpZDYKICBDTEVBTiAgIGxpYgogIENMRUFOICAgbmV0L3dpcmVsZXNzCiAgQ0xFQU4gICBzZWN1
cml0eS9hcHBhcm1vcgogIENMRUFOICAgc2VjdXJpdHkvc2VsaW51eAogIENMRUFOICAgc2VjdXJp
dHkvdG9tb3lvCiAgQ0xFQU4gICB1c3IKICBDTEVBTiAgIGFyY2gveDg2L2Jvb3QvY29tcHJlc3Nl
ZAogIENMRUFOICAgYXJjaC94ODYvYm9vdAogIENMRUFOICAgYXJjaC94ODYvdG9vbHMKICBDTEVB
TiAgIC50bXBfdmVyc2lvbnMKSEVBRCBpcyBub3cgYXQgZTNlZWYyZTY4YjI1IGd2dC1zdGFnaW5n
OiAyMDE5eS0wMW0tMTBkLTExaC00MG0tMDFzIENTVCBpbnRlZ3JhdGlvbiBtYW5pZmVzdApBbHJl
YWR5IHVwLXRvLWRhdGUuClN0YXJ0Ci9yb290L3BhdGNoZXMva3JheGVsLzExX0phbl8yMDE5XzEw
XzMxXzEyLmVtbAp2ZmlvOiB1cGRhdGUga2VybmVsIGhlYWRlcnMuXzwyMDE5MDExMTA5MzExNi4x
NzE4OC0yLWtyYXhlbEByZWRoYXQuY29tPgpBcHBseWluZzogdmZpbzogdXBkYXRlIGtlcm5lbCBo
ZWFkZXJzLgpQYXRjaCBmYWlsZWQgYXQgMDAwMSB2ZmlvOiB1cGRhdGUga2VybmVsIGhlYWRlcnMu
ClRoZSBjb3B5IG9mIHRoZSBwYXRjaCB0aGF0IGZhaWxlZCBpcyBmb3VuZCBpbjogLmdpdC9yZWJh
c2UtYXBwbHkvcGF0Y2gKV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1biAi
Z2l0IGFtIC0tY29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRvIHNraXAgdGhpcyBwYXRjaCwgcnVu
ICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFuY2gg
YW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLgplcnJvcjogbGludXgtaGVh
ZGVycy9saW51eC92ZmlvLmg6IGRvZXMgbm90IGV4aXN0IGluIGluZGV4Ci9yb290L3BhdGNoZXMv
a3JheGVsLzExX0phbl8yMDE5XzEwXzMxXzEyLmVtbCBmYWlsZWQhCg==

--===============2704570883368031582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============2704570883368031582==--
