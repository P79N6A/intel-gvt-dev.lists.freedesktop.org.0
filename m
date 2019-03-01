Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp399149ywe;
        Fri, 1 Mar 2019 01:42:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZs+W3yxflzHGY7L3Izy+AxmBHqmOs6Qs2dC5V6fWU87mxsyeYW/aLirNYTyJXfNP1zHFOt
X-Received: by 2002:a62:d10b:: with SMTP id z11mr4669177pfg.84.1551433345478;
        Fri, 01 Mar 2019 01:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551433345; cv=none;
        d=google.com; s=arc-20160816;
        b=fYWV25UwcKPQcDfZvZFCRhHafuWgbhc7YxKTHFzTS4GDNNowbu36ecaVooatmjyrEQ
         u8AQgn/H+G6Od/U+pbVAFL9dkOIfMvXZnjo9ZH+QK/BXgYk99D7xgUDTk0b9C1tnPpjn
         ZowJoRw4S8fGdb2+bTZCaFsR2eoEOfw4WcJnxYg3/G7p+SfKBK4WZQzR11BjKA+YbmhX
         EQdw+UW+ybENfKuRNO1J+hmjczbhJ/4wOjuwhxBk8uHPbUsvcCgOzm6MXNvV0iolrBfs
         8HhY0hgUMKyEcjneTjBqVpaNDWQP3OlIYbVv9qZ1QgbrVhWW6ashV8toR3tKiqvvskks
         CVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=4l0fXz6WmemNimEagtGXQzQ1Nz1f/y2+OLLjzsEhth0=;
        b=k5mJ0aW5DpMUHRbpFP68Q0OW/SK/BmZJsonqA15634Dkx7+KJILXOJpdhj/x5T9Vnb
         TY5uCU0vDvelGmzzHCC0MraKaghcc1039JJWQ1w1ZXjLuUptl0DCNJcWj24N/5OGPPAq
         A/yCqYNXEznTBrI84JmlSp/Hn5yZAlzkkIJ4KpvhJ7+SUdi48ntegpjdfMe/nBWr/TjZ
         BcKE2k7e4T1oIgdvw7sTRTTR6rRxqRQgd68EmFNL2tSGd79eFlRsiVPtL3s2hyWIdwYO
         /Qbsopw7VZU+n67nMqpT1o3CSM/P+iDUpzlmejADuSykjsVdcnHiovCQ9/aaFLdfx7A3
         vV+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t23si12105869pfa.64.2019.03.01.01.42.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 01:42:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E056E2AC;
	Fri,  1 Mar 2019 09:42:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69506E2AC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 09:42:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2019 01:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,427,1544515200"; d="scan'208";a="121784354"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga008.jf.intel.com with ESMTP; 01 Mar 2019 01:42:23 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 01:42:23 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 01:42:22 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.113]) with mapi id 14.03.0415.000;
 Fri, 1 Mar 2019 17:42:20 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/3] drm/i915/gvt: Only assign ppgtt root at dispatch
 time
Thread-Topic: [PATCH v2 2/3] drm/i915/gvt: Only assign ppgtt root at
 dispatch time
Thread-Index: AQHUz/0OKfLUVgSvnUybcuNRbOdmU6X2hbrg
Date: Fri, 1 Mar 2019 09:42:20 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC275440CB@SHSMSX104.ccr.corp.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <20190301070413.6036-2-zhenyuw@linux.intel.com>
In-Reply-To: <20190301070413.6036-2-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGZjNmNkMWYtMzg2Mi00OWNjLWJlM2UtNDBjNWMyMmNlZmNmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMEFacEZmbkpoZnZJdjJVQTN6eElYcmNqWjBwVDNVNGtjWkljOXJBSE02bk1icXVtaEt6XC9tcmtiK1VJVXNESUMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBUaGlzIG1vdmVzIHBwZ3R0IHJvb3QgaG9vayBvdXQgb2Ygc2NhbiBhbmQgc2hhZG93IGZ1bmN0
aW9uLCBhcyBpdCdzIG9ubHkKPiByZXF1aXJlZCBhdCBkaXNwYXRjaCB0aW1lLiBBbHNvIG1ha2Ug
c3VyZSB0aGlzIGNoZWNrcyBhZ2FpbnN0IHNoYWRvdyBtbSB0bwo+IGJlIHJlYWR5LCBvdGhlcndp
c2UgYmFpbCBlYXJsaWVyLgpbWmhhbmcsIFhpb25nIFldIGJhaWwgdG8gZmFpbAoKUmV2aWV3ZWQt
Ynk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KPiAKPiBDYzogWGlvbmcg
WmhhbmcgPHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBX
YW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3NjaGVkdWxlci5jIHwgMTYgKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuYwo+IGluZGV4IDViNTljYmE5ZjkzYS4uZTI4YTNiMzUxM2E0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+IEBAIC0zNDYsNyArMzQ2LDcgQEAg
c3RhdGljIGludCBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdyhzdHJ1Y3QKPiBpbnRlbF92
Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCwKPiAgCWludCBpID0gMDsKPiAKPiAgCWlmIChtbS0+dHlw
ZSAhPSBJTlRFTF9HVlRfTU1fUFBHVFQKPiB8fCAhbW0tPnBwZ3R0X21tLnNoYWRvd2VkKQo+IC0J
CXJldHVybiAtMTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAKPiAgCWlmIChtbS0+cHBndHRfbW0u
cm9vdF9lbnRyeV90eXBlID09Cj4gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgewo+ICAJ
CXB4X2RtYSgmcHBndHQtPnBtbDQpID0gbW0tPnBwZ3R0X21tLnNoYWRvd19wZHBzWzBdOyBAQAo+
IC00MTAsMTIgKzQxMCw2IEBAIGludCBpbnRlbF9ndnRfc2Nhbl9hbmRfc2hhZG93X3dvcmtsb2Fk
KHN0cnVjdAo+IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+ICAJaWYgKHdvcmtsb2Fk
LT5zaGFkb3cpCj4gIAkJcmV0dXJuIDA7Cj4gCj4gLQlyZXQgPSBzZXRfY29udGV4dF9wcGd0dF9m
cm9tX3NoYWRvdyh3b3JrbG9hZCwgc2hhZG93X2N0eCk7Cj4gLQlpZiAocmV0IDwgMCkgewo+IC0J
CWd2dF92Z3B1X2Vycigid29ya2xvYWQgc2hhZG93IHBwZ3R0IGlzbid0IHJlYWR5XG4iKTsKPiAt
CQlyZXR1cm4gcmV0Owo+IC0JfQo+IC0KPiAgCS8qIHBpbiBzaGFkb3cgY29udGV4dCBieSBndnQg
ZXZlbiB0aGUgc2hhZG93IGNvbnRleHQgd2lsbCBiZSBwaW5uZWQKPiAgCSAqIHdoZW4gaTkxNSBh
bGxvYyByZXF1ZXN0LiBUaGF0IGlzIGJlY2F1c2UgZ3Z0IHdpbGwgdXBkYXRlIHRoZSBndWVzdAo+
ICAJICogY29udGV4dCBmcm9tIHNoYWRvdyBjb250ZXh0IHdoZW4gd29ya2xvYWQgaXMgY29tcGxl
dGVkLCBhbmQgYXQKPiB0aGF0IEBAIC02NzgsNiArNjcyLDggQEAgc3RhdGljIGludCBkaXNwYXRj
aF93b3JrbG9hZChzdHJ1Y3QKPiBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkgIHsKPiAg
CXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gd29ya2xvYWQtPnZncHU7Cj4gIAlzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2Z3B1LT5ndnQtPmRldl9wcml2Owo+ICsJc3RydWN0
IGludGVsX3ZncHVfc3VibWlzc2lvbiAqcyA9ICZ2Z3B1LT5zdWJtaXNzaW9uOwo+ICsJc3RydWN0
IGk5MTVfZ2VtX2NvbnRleHQgKnNoYWRvd19jdHggPSBzLT5zaGFkb3dfY3R4Owo+ICAJc3RydWN0
IGk5MTVfcmVxdWVzdCAqcnE7Cj4gIAlpbnQgcmluZ19pZCA9IHdvcmtsb2FkLT5yaW5nX2lkOwo+
ICAJaW50IHJldDsKPiBAQCAtNjg4LDYgKzY4NCwxMiBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dv
cmtsb2FkKHN0cnVjdAo+IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+ICAJbXV0ZXhf
bG9jaygmdmdwdS0+dmdwdV9sb2NrKTsKPiAgCW11dGV4X2xvY2soJmRldl9wcml2LT5kcm0uc3Ry
dWN0X211dGV4KTsKPiAKPiArCXJldCA9IHNldF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHdv
cmtsb2FkLCBzaGFkb3dfY3R4KTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZ3Z0X3ZncHVfZXJy
KCJ3b3JrbG9hZCBzaGFkb3cgcHBndHQgaXNuJ3QgcmVhZHlcbiIpOwo+ICsJCWdvdG8gZXJyX3Jl
cTsKPiArCX0KPiArCj4gIAlyZXQgPSBpbnRlbF9ndnRfd29ya2xvYWRfcmVxX2FsbG9jKHdvcmts
b2FkKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBlcnJfcmVxOwo+IC0tCj4gMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
